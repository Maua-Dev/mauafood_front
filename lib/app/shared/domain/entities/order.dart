import '../enums/status_enum.dart';

class Order {
  StatusEnum status;
  final String userName;
  final String id;
  final String userId;
  final double totalPrice;
  final int creationTime;
  final String? abortedReason;
  final DateTime? time;

  Order(
      {required this.status,
      required this.userName,
      required this.id,
      required this.userId,
      required this.totalPrice,
      required this.creationTime,
      this.abortedReason,
      this.time});
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
}
