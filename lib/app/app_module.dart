import 'package:flutter_modular/flutter_modular.dart';
import 'modules/menu/employee_menu_module.dart';
import 'modules/employee_auth_guard.dart';
import 'modules/menu/user_menu_module.dart';
import 'modules/splash/splash_module.dart';

import 'modules/auth/auth_module.dart';
import 'modules/user_auth_guard.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: SplashModule(),
        ),
        ModuleRoute(
          '/login',
          module: AuthModule(),
        ),
        ModuleRoute(
          '/employee',
          module: EmployeeMenuModule(),
          guards: [EmployeeAuthGuard()],
        ),
        ModuleRoute(
          '/user',
          module: UserMenuModule(),
          guards: [UserAuthGuard()],
        ),
      ];
}
