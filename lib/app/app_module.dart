import 'package:auth_package/login.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'modules/menu/user_menu_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule()];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: SplashModule(),
        ),
        ModuleRoute('/login',
            module: MicroAppLoginModule(), guards: [LoginGuard()]),
        ModuleRoute(
          '/user',
          module: UserMenuModule(),
        ),
      ];
}
