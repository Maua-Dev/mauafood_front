import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';

class Order {
  final String owner;
  final String id;
  final double totalPrice;
  final String description;
  final StatusEnum status;
  final String hour;
  final List<String> products;
  Order(
      {required this.owner,
      required this.id,
      required this.totalPrice,
      required this.description,
      required this.status,
      required this.hour,
      required this.products});
}
