import 'package:mauafood_front/app/modules/restaurants/domain/usecases/get_restaurant.dart';
import '../../domain/entities/restaurant.dart';

class RestaurantController {
  final IGetRestaurant getRestaurant;
  List<Restaurant> restaurants = [];

  RestaurantController({required this.getRestaurant}) {
    getRestaurants();
  }

  void getRestaurants() {
    restaurants = getRestaurant();
  }
}
