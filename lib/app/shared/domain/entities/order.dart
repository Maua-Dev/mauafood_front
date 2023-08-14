import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';

class Order {
  final String id;
  final double totalPrice;
  final String description;
  final StatusEnum status;
  final String hour;
  Order(
      {required this.id,
      required this.totalPrice,
      required this.description,
      required this.status,
      required this.hour});
}
