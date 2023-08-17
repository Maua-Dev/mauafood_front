import '../enums/status_enum.dart';

class Order {
  StatusEnum status;
  final String owner;
  final String id;
  final double totalPrice;
  final String description;
  final String hour;
  final List<String> products;
  Order({
    required this.status,
    required this.owner,
    required this.id,
    required this.totalPrice,
    required this.description,
    required this.hour,
    required this.products,
  });
}
