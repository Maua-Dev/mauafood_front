import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/usecases/get_restaurant.dart';

import '../../../auth/domain/infra/auth_storage_interface.dart';
import '../../domain/entities/restaurant_entity.dart';

class RestaurantController {
  final GetRestaurantInterface getRestaurant;
  List<Restaurant> restaurants = [];

  RestaurantController({required this.getRestaurant}) {
    getRestaurants();
  }

  void getRestaurants() {
    restaurants = getRestaurant();
  }
}
