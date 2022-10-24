import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/entities/restaurant_entity.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/usecases/get_restaurant.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/controllers/restaurant_controller.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/pages/restaurants_page.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurants_module.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'restaurant_controller_test.mocks.dart';

@GenerateMocks([GetRestaurantInterface])
void main() {
  initModules([AppModule(), RestaurantModule()]);

  GetRestaurantInterface restaurants = MockGetRestaurantInterface();
  late RestaurantController controller;
  var listMock = const [
    Restaurant(restaurantInfo: RestaurantEnum.restaurantBiba),
    Restaurant(restaurantInfo: RestaurantEnum.restaurantH)
  ];

  setUp(() {
    controller = RestaurantController(getRestaurant: restaurants);
  });

  test('return a List<Restaurant> correct', () async {
    when(restaurants.call()).thenAnswer((realInvocation) => listMock);
    controller.getRestaurants();
    expect(controller.restaurants, listMock);
  });
}
