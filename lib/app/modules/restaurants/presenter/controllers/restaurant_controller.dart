import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant.dart';
import '../../../../shared/domain/entities/restaurant.dart';

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
