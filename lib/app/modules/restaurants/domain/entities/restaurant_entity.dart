import 'package:equatable/equatable.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';

class Restaurant extends Equatable{
  final RestaurantEnum restaurantInfo;
  

  const Restaurant({required this.restaurantInfo});
  
  @override
  List<Object?> get props => [
    restaurantInfo,
  ];
}