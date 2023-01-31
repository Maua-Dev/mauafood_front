import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurant_module.dart';
import 'modules/employee/presenter/ui/employee_menu_page.dart';
import 'modules/employee_auth_guard.dart';
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
        ChildRoute('/employee',
            child: (context, args) => const EmployeeMenuPage(),
            guards: [EmployeeAuthGuard()]),
      ];
}
