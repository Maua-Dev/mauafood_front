import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurant_module.dart';

import 'modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: RestaurantModule()),
        ModuleRoute('/login', module: AuthModule()),
      ];
}
