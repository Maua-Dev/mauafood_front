import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

class Feedback {
  final String orderId;
  final RestaurantEnum restaurant;
  final int value;

  Feedback(
      {required this.orderId, required this.restaurant, required this.value});
}
