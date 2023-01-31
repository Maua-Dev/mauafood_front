import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/user_menu_module.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/usecases/get_restaurant.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/controllers/restaurant_controller.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/pages/restaurants_page.dart';

import '../auth/auth_module.dart';
import '../user_auth_guard.dart';

class RestaurantModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];
  @override
  List<Bind> get binds => [
        Bind<GetRestaurantInterface>((i) => GetRestaurantImpl()),
        Bind<RestaurantController>((i) => RestaurantController(
              getRestaurant: i(),
            ))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const RestaurantsPage(),
            guards: [UserAuthGuard()]),
        ModuleRoute('/menu',
            module: UserMenuModule(), guards: [UserAuthGuard()])
      ];
}
