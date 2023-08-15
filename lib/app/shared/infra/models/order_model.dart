import 'package:mauafood_front/app/shared/domain/entities/order.dart';
import 'package:mobx/mobx.dart';

class OrderModel extends Order {
  Observable? isExpanded;
  OrderModel(
      {required super.id,
      required super.totalPrice,
      required super.description,
      required super.status,
      required super.hour,
      required super.products,
      this.isExpanded});
}
