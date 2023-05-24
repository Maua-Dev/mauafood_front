import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/shared/domain/entities/restaurant.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/controllers/restaurant_controller.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurant_module.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'restaurant_controller_test.mocks.dart';

@GenerateMocks([IGetRestaurant])
void main() {
  initModules([AppModule(), RestaurantModule()]);

  IGetRestaurant getRestaurants = MockIGetRestaurant();
  late RestaurantController controller;
  var listMock = const [
    Restaurant(restaurantInfo: RestaurantEnum.biba),
    Restaurant(restaurantInfo: RestaurantEnum.hora_h)
  ];

  setUp(() {
    when(getRestaurants()).thenAnswer((realInvocation) => listMock);
    controller = RestaurantController(getRestaurant: getRestaurants);
  });

  test('return a List<Restaurant> correct', () async {
    controller.getRestaurants();
    expect(controller.restaurants, listMock);
  });
}
