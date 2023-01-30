import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurant_module.dart';
import 'modules/splash/splash_module.dart';

import 'modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/login', module: AuthModule()),
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute('/restaurants', module: RestaurantModule()),
      ];
}
