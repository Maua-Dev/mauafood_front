import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../states/orders/orders_state.dart';
part 'orders_controller.g.dart';

class OrdersController = OrdersControllerBase with _$OrdersController;

abstract class OrdersControllerBase with Store {
  OrdersControllerBase() {
    getAllOrderList();
  }

  List<StatusEnum> statusList = [...StatusEnum.values];

  List<OrderModel> list = [
    OrderModel(
        owner: "Brenas",
        id: '1',
        totalPrice: 55,
        description: "Bauru sem tomate com pepino e maionese verde",
        status: StatusEnum.READY,
        products: [
          "Bauru",
          "Pepino",
          "Maionese Verde",
        ],
        hour: "10:20"),
    OrderModel(
        owner: "Vitor Soller",
        id: '2',
        totalPrice: 10,
        description: "",
        status: StatusEnum.CANCELED,
        products: ["Cachorro Quente"],
        hour: "10:30"),
    OrderModel(
        owner: "Carol Mota",
        id: '3',
        totalPrice: 15,
        description: "",
        status: StatusEnum.IN_PREPARATION,
        products: ["Bife acebolado", "Coxinha"],
        hour: "9:30"),
    OrderModel(
        owner: "Enrico Santarelli",
        id: '4',
        totalPrice: 115,
        description: "Calabresa e um vasco",
        status: StatusEnum.PENDING,
        products: ["Calabresão", "Vasco"],
        hour: "9:00"),
    OrderModel(
        owner: "Vitor Soller",
        id: '2',
        totalPrice: 10,
        description: "",
        status: StatusEnum.CANCELED,
        products: ["Cachorro Quente"],
        hour: "10:30"),
    OrderModel(
        owner: "Carol Mota",
        id: '3',
        totalPrice: 15,
        description: "",
        status: StatusEnum.IN_PREPARATION,
        products: ["Bife acebolado", "Coxinha"],
        hour: "9:30"),
    OrderModel(
        owner: "Enrico Santarelli",
        id: '4',
        totalPrice: 115,
        description: "Calabresa e um vasco",
        status: StatusEnum.PENDING,
        products: ["Calabresão", "Vasco"],
        hour: "9:00"),
  ];

  @observable
  OrdersState state = OrdersInitialState();

  @action
  void changeState(OrdersState value) => state = value;

  @observable
  List<OrderModel>? ordersList;

  @observable
  StatusEnum statusFiltered = StatusEnum.ALL;

  @action
  void getAllOrderList() {
    ordersList = list;
    changeState(OrdersLoadedSuccessState(ordersList: ordersList!));
    ordersList!.sort(
      (a, b) {
        return a.status.index.compareTo(b.status.index);
      },
    );
  }

  @action
  void setOrderStatus(int index, StatusEnum? value) {
    ordersList![index].status = value!;

    ordersList!.sort(
      (a, b) {
        return a.status.index.compareTo(b.status.index);
      },
    );
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
      list = list!
          .where(
            (e) => e.status == status,
          )
          .toList();
    }

    changeState(OrdersLoadedSuccessState(ordersList: list!));
  }

  @observable
  int reasonIndex = 0;

  @action
  void setReasonIndex(int value) {
    reasonIndex = value;
  }

  @observable
  String reasonDescription = '';

  @action
  void setReasonDescription(String value) {
    reasonDescription = value;
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
