import 'package:mauafood_front/app/shared/domain/entities/order.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';

class OrderModel extends Order {
  final List<OrderProductModel> products;

  OrderModel(
      {required super.status,
      required super.id,
      required super.totalPrice,
      required super.userName,
      required super.userId,
      required super.creationTime,
      super.abortedReason,
      required this.products});

  factory OrderModel.fromMap(Map<String, dynamic> json) {
    return OrderModel(
        id: json['order_id'],
        creationTime: json['creation_time_milliseconds'],
        status: StatusEnumExtension.stringToEnumMap(json['status']),
        totalPrice: json['total_price'],
        abortedReason: json['aborted_reason'],
        userId: json['user_id'],
        userName: json['user_name'],
        products: OrderProductModel.fromMaps(json['products']));
  }

  static List<OrderModel> fromMaps(List array) {
    return array.map((e) => OrderModel.fromMap(e)).toList();
  }
}

class OrderProductModel extends OrderProduct {
  OrderProductModel({
    required super.id,
    required super.name,
    required super.quantity,
    required super.observation,
  });

  factory OrderProductModel.fromMap(Map<String, dynamic> json) {
    return OrderProductModel(
        id: json['product_id'],
        name: json['product_name'],
        quantity: json['quantity'],
        observation: json["observation"]);
  }

  static List<OrderProductModel> fromMaps(List array) {
    return array.map((e) => OrderProductModel.fromMap(e)).toList();
  }
}
