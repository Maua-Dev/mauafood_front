import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/pages/restaurants_page.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurant_module.dart';

import 'navbar_controller.dart';

class LandingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<NavigationBarController>((i) =>
        NavigationBarController( pageController: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const RestaurantsPage(),
        children: [
          ModuleRoute(
            '/user',
            module: RestaurantModule(),
          ),
        ]),
  ];
}