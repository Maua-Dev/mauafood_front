import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/usecases/get_restaurant.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/controllers/restaurant_controller.dart';
import 'package:mauafood_front/app/modules/restaurants/ui/pages/restaurants_page.dart';

class RestaurantModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<GetRestaurantInterface>((i) => GetRestaurantImpl()),
        Bind<RestaurantController>(
            (i) => RestaurantController(getRestaurant: i()))
      ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, 
    child:(context, args) => const RestaurantsPage())];
}
