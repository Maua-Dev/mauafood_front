import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/usecases/get_restaurant.dart';

import '../../../auth/domain/infra/auth_storage_interface.dart';
import '../../domain/entities/restaurant_entity.dart';

class RestaurantController {
  final GetRestaurantInterface getRestaurant;
  final AuthStorageInterface storage;
  List<Restaurant> restaurants = [];

  RestaurantController({required this.storage, required this.getRestaurant}) {
    getRestaurants();
  }

  void getRestaurants() {
    restaurants = getRestaurant();
  }

  Future<void> logout() async {
    try {
      await Amplify.Auth.signOut();
      await storage.cleanSecureStorage();
      Modular.to.navigate('/login');
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}
