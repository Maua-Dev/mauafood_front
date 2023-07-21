import 'package:auth_package/core/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant.dart';
import '../../../../shared/domain/entities/restaurant.dart';

class RestaurantController {
  final IGetRestaurant getRestaurant;
  List<Restaurant> restaurants = [];
  final AuthStore _authStore;
  RestaurantController(this._authStore, this.getRestaurant) {
    getRestaurants();
  }

  void logout() async {
    await _authStore.signOut();
    Modular.to.navigate('/login/');
  }

  void getRestaurants() {
    restaurants = getRestaurant();
  }
}
