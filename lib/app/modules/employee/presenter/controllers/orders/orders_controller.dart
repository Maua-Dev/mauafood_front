import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import 'package:mobx/mobx.dart';
part 'orders_controller.g.dart';

class OrdersController = OrdersControllerBase with _$OrdersController;

abstract class OrdersControllerBase with Store {
  @observable
  List<OrderModel> ordersList = <OrderModel>[
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
        status: StatusEnum.IN_PREPARATION,
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
        status: StatusEnum.IN_PREPARATION,
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
}
