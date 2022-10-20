
import 'package:mauafood_front/app/modules/restaurants/domain/entities/restaurant_entity.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';

abstract class GetRestaurantInterface{
  List<Restaurant>call();
}

class GetRestaurantImpl implements GetRestaurantInterface{
  final List<Restaurant> listRestaurant = [const Restaurant(restaurantInfo: RestaurantEnum.restaurantBiba), const Restaurant(restaurantInfo: RestaurantEnum.restaurantH)];

  @override
  List<Restaurant> call() {
    return listRestaurant;
  }

}