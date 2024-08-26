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
  final String? observation;
  OrderProduct({
    required this.id,
    required this.name,
    required this.quantity,
    this.observation,
  });
}

class OrderStatus {
  final String id;
  final StatusEnum status;
  final String? abortedReason;
  OrderStatus({
    required this.id,
    required this.status,
    this.abortedReason,
  });
}
