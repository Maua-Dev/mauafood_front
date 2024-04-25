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

  @observable
  List<OrderModel> ordersList = [];

  @observable
  StatusEnum statusFiltered = StatusEnum.ALL;

  void listenToWebsocket(dynamic event) {
    var order = OrderModel.fromMap(jsonDecode(event));

    ordersList.insert(0, order);
    ordersList.sort((a, b) {
      if (a.status.index.compareTo(b.status.index) == 0) {
        return a.creationTime.compareTo(b.creationTime);
      } else {
        return a.status.index.compareTo(b.status.index);
      }
    });
    changeState(OrdersLoadedSuccessState(ordersList: ordersList));
  }

  @action
  Future<void> getAllActiveOrders() async {
    changeState(OrdersLoadingState());
    /* ordersList = mockedOrdersList;
    ordersList.sort((a, b) {
      if (a.status.index.compareTo(b.status.index) == 0) {
        return a.creationTime.compareTo(b.creationTime);
      } else {
        return a.status.index.compareTo(b.status.index);
      }
    });
    changeState(OrdersLoadedSuccessState(ordersList: ordersList)); */
    var result = await _getAllActiveOrdersUsecase();
    changeState(result.fold((l) => OrdersErrorState(failure: l), (list) {
      ordersList = list;
      ordersList.sort((a, b) {
        if (a.status.index.compareTo(b.status.index) == 0) {
          return a.creationTime.compareTo(b.creationTime);
        } else {
          return a.status.index.compareTo(b.status.index);
        }
      });
      return OrdersLoadedSuccessState(ordersList: list);
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
        return a.creationTime.compareTo(b.creationTime);
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
        return a.creationTime.compareTo(b.creationTime);
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
    var list = ordersList;
    statusIndex = index;
    statusFiltered = status;
    if (index != 0) {
      list = list
          .where(
            (e) => e.status == status,
          )
          .toList();
    }

    changeState(OrdersLoadedSuccessState(ordersList: list));
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
