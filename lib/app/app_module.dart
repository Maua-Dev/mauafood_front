import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurant_module.dart';

import 'modules/auth/auth_module.dart';
import 'modules/auth_guard.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [AuthModule()];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute,
            module: RestaurantModule(), guards: [AuthGuard()]),
        ModuleRoute('/login', module: AuthModule()),
      ];
}
