import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

class Schedule{
  
  final String id;
  final DateTime initialTime;
  final DateTime endTime;
  final RestaurantEnum resturant;
  final bool acceptedReservation;

  Schedule(
    {required this.id,
     required this.initialTime,
    required this.endTime,
    required this.resturant,
    required this.acceptedReservation});
}



