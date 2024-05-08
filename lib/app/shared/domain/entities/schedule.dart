import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

class Schedule{
  
  final String id;
  final DateTime initialTime;
  final RestaurantEnum resturant;
  final bool isActive;

  Schedule(
    this.id,
    this.initialTime,
    this.resturant,
    this.isActive);
}

