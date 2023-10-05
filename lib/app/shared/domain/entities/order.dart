import '../enums/status_enum.dart';

class Order {
  StatusEnum status;
  final String userName;
  final String id;
  final String userId;
  final double totalPrice;
  final int creationTime;
  final String? abortedReason;

  Order(
      {required this.status,
      required this.userName,
      required this.id,
      required this.userId,
      required this.totalPrice,
      required this.creationTime,
      this.abortedReason});
}

class OrderProduct {
  final String id;
  final String name;
  final int quantity;
  final String observation;
  OrderProduct({
    required this.id,
    required this.name,
    required this.quantity,
    required this.observation,
  });

  factory OrderProduct.fromMap(Map<String, dynamic> json) {
    return OrderProduct(
        id: json['product_id'],
        name: json['product_name'],
        quantity: json['quantity'],
        observation: json['observation']);
  }

  static List<OrderProduct> fromMaps(List array) {
    return array.map((e) => OrderProduct.fromMap(e)).toList();
  }
}
