import 'package:mauafood_front/app/shared/domain/entities/order.dart';

class OrderModel extends Order {
  OrderModel({
    required super.status,
    required super.id,
    required super.owner,
    required super.totalPrice,
    required super.description,
    required super.hour,
    required super.products,
  });
}
