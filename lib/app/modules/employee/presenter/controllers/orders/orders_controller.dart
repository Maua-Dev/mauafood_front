import 'dart:async';

import 'package:flutter/material.dart';
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
  OrdersControllerBase(this._getAllActiveOrdersUsecase,
      this._changeOrderStatusUsecase, this._abortOrderUsecase) {
    startTimer();
  }

  List<StatusEnum> statusList = [...StatusEnum.values];

  /* List<OrderModel> mockedOrdersList = [
    OrderModel(
      userName: "Brenas",
      userId: "93bc6ada-c0d1-7054-66ab-e17414c48af9",
      id: "d4c63753-5119-4990-b427-926798499924",
      totalPrice: 55,
      observation: "Bauru sem tomate com pepino e maionese verde",
      status: StatusEnum.READY,
      products: [
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221baae",
            name: "Carteira",
            quantity: 3)
      ],
      creationTime: 1692156322000,
    ),
    OrderModel(
      userName: "Vitor Soller",
      userId: "93bc6ada-c0d1-7054-66ab-e17414c48af9",
      id: "d4c63753-5119-4990-b427-926798499924",
      totalPrice: 10,
      status: StatusEnum.CANCELED,
      products: [
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221baae",
            name: "Carteira",
            quantity: 2)
      ],
      creationTime: 1692156322000,
    ),
    OrderModel(
      userName: "Carol Mota",
      userId: "93bc6ada-c0d1-7054-66ab-e17414c48af9",
      id: "d4c63753-5119-4990-b427-926798499924",
      totalPrice: 15,
      status: StatusEnum.REFUSED,
      products: [
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221baae",
            name: "Lateral",
            quantity: 3),
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221basd",
            name: "Computador",
            quantity: 1),
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221ba32",
            name: "Coxinha",
            quantity: 2),
      ],
      creationTime: 1692156322000,
    ),
    OrderModel(
      userName: "Enrico Santarelli",
      userId: "93bc6ada-c0d1-7054-66ab-e17414c48af9",
      id: "d4c63753-5119-4990-b427-926798499924",
      totalPrice: 115,
      observation: "Calabresa e um vasco",
      status: StatusEnum.PENDING,
      products: [
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221baae",
            name: "Carteira",
            quantity: 3)
      ],
      creationTime: 1692156322000,
    ),
    OrderModel(
      userName: "Vitor Soller",
      userId: "93bc6ada-c0d1-7054-66ab-e17414c48af9",
      id: "d4c63753-5119-4990-b427-926798499924",
      totalPrice: 10,
      status: StatusEnum.CANCELED,
      products: [
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221baae",
            name: "Carteira",
            quantity: 3)
      ],
      creationTime: 1692156322000,
    ),
    OrderModel(
      userName: "Carol Mota",
      userId: "93bc6ada-c0d1-7054-66ab-e17414c48af9",
      id: "d4c63753-5119-4990-b427-926798499924",
      totalPrice: 15,
      status: StatusEnum.PREPARING,
      products: [
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221baae",
            name: "Carteira",
            quantity: 2),
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221basd",
            name: "Pão de Queijo",
            quantity: 1),
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221ba32",
            name: "Joelho",
            quantity: 1),
      ],
      creationTime: 1692156322000,
    ),
    OrderModel(
      userName: "Enrico Santarelli",
      userId: "93bc6ada-c0d1-7054-66ab-e17414c48af9",
      id: "d4c63753-5119-4990-b427-926798499924",
      totalPrice: 115,
      observation: "Calabresa e um vasco",
      status: StatusEnum.REFUSED,
      products: [
        OrderProductModel(
            id: "9589b258-ed44-4c24-b7d6-e96ae221baae",
            name: "Carteira",
            quantity: 3),
      ],
      creationTime: 1692156322000,
    ),
  ]; */

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
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getAllActiveOrders();
    });
  }

  bool isFirst = true;

  @observable
  List<OrderModel> ordersList = [];

  @observable
  StatusEnum statusFiltered = StatusEnum.ALL;

  @action
  Future<void> getAllActiveOrders() async {
    if (isFirst) {
      changeState(OrdersLoadingState());
      isFirst = false;
    }
    var result = await _getAllActiveOrdersUsecase();
    changeState(result.fold((l) => OrdersErrorState(failure: l), (list) {
      for (var element in list) {
        for (var beforeElement in ordersList) {
          if (element.id == beforeElement.id) {
            break;
          }
        }
        ordersList.add(element);
      }
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
