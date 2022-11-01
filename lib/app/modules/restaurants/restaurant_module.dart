import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/menu_module.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/usecases/get_restaurant.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/controllers/restaurant_controller.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/pages/restaurants_page.dart';

import '../auth_guard.dart';

class RestaurantModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<GetRestaurantInterface>((i) => GetRestaurantImpl()),
        Bind<RestaurantController>(
            (i) => RestaurantController(getRestaurant: i(), storage: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const RestaurantsPage(),
            guards: [AuthGuard()]),
        ModuleRoute('/menu', module: MenuModule(), guards: [AuthGuard()])
      ];
}
