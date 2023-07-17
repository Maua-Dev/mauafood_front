import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/landing/landing_module.dart';
import 'modules/menu/user_menu_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  // @override
  // List<Module> get imports => [AuthModule()];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: SplashModule(),
        ),
        // ModuleRoute(
        //   '/login',
        //   module: AuthModule(),
        // ),
        // ModuleRoute(
        //   '/employee',
        //   module: EmployeeMenuModule(),
        //   guards: [EmployeeAuthGuard()],
        // ),
         ModuleRoute(
          '/landing',
          module: LandingModule(),
          // guards: [UserAuthGuard()],
        ),
        ModuleRoute(
          '/user',
          module: UserMenuModule(),
          // guards: [UserAuthGuard()],
        ),
      ];
}
