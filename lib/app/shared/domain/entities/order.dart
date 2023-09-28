import '../enums/status_enum.dart';

class Order {
  StatusEnum status;
  final String userName;
  final String id;
  final String userId;
  final double totalPrice;
  final int creationTime;
  final String? abortedReason;
  final String? observation;

  Order(
      {required this.status,
      required this.userName,
      required this.id,
      required this.userId,
      required this.totalPrice,
      this.observation,
      required this.creationTime,
      this.abortedReason});
}

class OrderProduct {
  final String id;
  final String name;
  final int quantity;
  OrderProduct({
    required this.id,
    required this.name,
    required this.quantity,
  });

  factory OrderProduct.fromMap(Map<String, dynamic> json) {
    return OrderProduct(
        id: json['product_id'],
        name: json['product_name'],
        quantity: json['quantity']);
  }

  static List<OrderProduct> fromMaps(List array) {
    return array.map((e) => OrderProduct.fromMap(e)).toList();
  }
}
