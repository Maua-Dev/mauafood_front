import 'dart:async';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mauafood_front/app/modules/employee/external/order_websocket.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/orders/order_state.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/domain/usecases/abort_order_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/change_order_status_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_all_active_orders.dart';
import 'package:mauafood_front/app/shared/helpers/services/snackbar/global_snackbar.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../states/orders/orders_state.dart';
part 'orders_controller.g.dart';

class OrdersController = OrdersControllerBase with _$OrdersController;

abstract class OrdersControllerBase with Store {
  final IGetAllActiveOrdersUsecase _getAllActiveOrdersUsecase;
  final IChangeOrderStatusUsecase _changeOrderStatusUsecase;
  final IAbortOrderUsecase _abortOrderUsecase;

  final OrderWebsocket orderWebsocket;
  OrdersControllerBase(
      this._getAllActiveOrdersUsecase,
      this._changeOrderStatusUsecase,
      this._abortOrderUsecase,
      this.orderWebsocket) {
    getAllActiveOrders();
    orderWebsocket.channel.stream.listen(listenToWebsocket);
  }

  List<StatusEnum> statusList = [...StatusEnum.values];

  @observable
  OrdersState state = OrdersInitialState();

  @action
  void changeState(OrdersState value) => state = value;

  @observable
  OrderState orderState = OrderInitialState();

  @action
  void changeOrderState(OrderState value) => orderState = value;

  Timer? timer;

  void startTimer() {
    getAllActiveOrders();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      getAllActiveOrders();
    });
  }

  bool isFirst = true;

  @observable
  List<OrderModel> ordersList = [];

  @observable
  StatusEnum statusFiltered = StatusEnum.ALL;


// method to subtract 3 hours from creationTime (setting the DateTime to local time)
DateTime adjustForTimezone(DateTime dateTime) {
  DateTime adjustedDateTime = dateTime.subtract(const Duration(hours: 3));
  return adjustedDateTime;
}

  void listenToWebsocket(dynamic event) {
  if (event == null) return;
  var order = OrderModel.fromMap(jsonDecode(event));


  if (!ordersList.any((existingOrder) => existingOrder.id == order.id)) {
    ordersList.insert(0, order);
  }

  var filteredList = ordersList;
  if (statusFiltered != StatusEnum.ALL) {
    filteredList = filteredList.where((order) => order.status == statusFiltered).toList();
  }

filteredList.sort((a, b) {
if (a.status.index.compareTo(b.status.index) == 0) {
        return adjustForTimezone(DateTime.fromMillisecondsSinceEpoch(a.creationTime, isUtc: true))
            .compareTo(adjustForTimezone(DateTime.fromMillisecondsSinceEpoch(b.creationTime, isUtc: true)));
      } else {
        return a.status.index.compareTo(b.status.index);
      }
  });


  changeState(OrdersLoadedSuccessState(ordersList: filteredList));
}
@action
Future<void> getAllActiveOrders() async {
  if (isFirst) {
    changeState(OrdersLoadingState());
    isFirst = false;
  }
  
  var result = await _getAllActiveOrdersUsecase();
  changeState(result.fold((l) => OrdersErrorState(failure: l), (list) {
    for (var element in list) {
      if (!ordersList.any((order) => order.id == element.id)) {
        ordersList.add(element);
      }
    }


    var filteredList = ordersList;
    if (statusFiltered != StatusEnum.ALL) {
      filteredList = filteredList.where((order) => order.status == statusFiltered).toList();
    }


      filteredList.sort((a, b) {
      if (a.status.index.compareTo(b.status.index) == 0) {
        return adjustForTimezone(DateTime.fromMillisecondsSinceEpoch(a.creationTime, isUtc: true))
            .compareTo(adjustForTimezone(DateTime.fromMillisecondsSinceEpoch(b.creationTime, isUtc: true)));
      } else {
        return a.status.index.compareTo(b.status.index);
      }
  });


    return OrdersLoadedSuccessState(ordersList: filteredList);
  }));
}
  @action
  Future<void> changeOrderStatus(
      int index, StatusEnum? value, BuildContext context) async {
    changeOrderState(OrderLoadingState(index));

    var result = await _changeOrderStatusUsecase(ordersList[index].id, value!);
    changeOrderState(
      result.fold(
        (l) {
          GlobalSnackBar.error(l.message);

          OrdersErrorState(failure: l);
          return OrderErrorState(failure: l);
        },
        (r) {
          ordersList[index].status = r.status;
          return OrderLoadedSuccessState();
        },
      ),
    );

    ordersList.sort((a, b) {
     if (a.status.index.compareTo(b.status.index) == 0) {
        return adjustForTimezone(DateTime.fromMillisecondsSinceEpoch(a.creationTime, isUtc: true))
            .compareTo(adjustForTimezone(DateTime.fromMillisecondsSinceEpoch(b.creationTime, isUtc: true)));
      } else {
        return a.status.index.compareTo(b.status.index);
      }
    });

    setStatusIndex(statusIndex, statusFiltered);
  }

  @action
  Future<void> abortOrder(int index, BuildContext context) async {
    changeOrderState(OrderLoadingState(index));
    var result = await _abortOrderUsecase(ordersList[index].id, abortReason);

    changeOrderState(
      result.fold(
        (l) {
          GlobalSnackBar.error(l.message);
          changeState(OrdersErrorState(failure: l));
          return OrderErrorState(failure: l);
        },
        (r) {
          ordersList[index].status = r.status;
          return OrderLoadedSuccessState();
        },
      ),
    );
    ordersList.sort((a, b) {
      if (a.status.index.compareTo(b.status.index) == 0) {
        return adjustForTimezone(DateTime.fromMillisecondsSinceEpoch(a.creationTime, isUtc: true))
            .compareTo(adjustForTimezone(DateTime.fromMillisecondsSinceEpoch(b.creationTime, isUtc: true)));
      } else {
        return a.status.index.compareTo(b.status.index);
      }
    });

    setStatusIndex(statusIndex, statusFiltered);
  }

  @observable
  int statusIndex = 0;

  @action
void setStatusIndex(int index, StatusEnum status) {
  statusIndex = index;
  statusFiltered = status;

  var filteredList = ordersList;
  if (status != StatusEnum.ALL) {
    filteredList = filteredList.where((order) => order.status == status).toList();
  }

  changeState(OrdersLoadedSuccessState(ordersList: filteredList));
}

  @observable
  int reasonIndex = 0;

  @action
  void setReasonIndex(int value) {
    reasonIndex = value;
  }

  @observable
  String abortReason = '';

  @action
  void setAbortReason(String value) {
    abortReason = value;
  }

  @action
  String? validateReasonDescription(String? value) {
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    }
    return null;
  }

  @observable
  bool isMissingDescription = false;
}
