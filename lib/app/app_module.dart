import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/services/dio/mauafood_product_options.dart';
import 'modules/menu/user_menu_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  // @override
  // List<Module> get imports => [AuthModule()];

  @override
  List<Bind> get binds =>
      [Bind.lazySingleton((i) => Dio(mauafoodProductBaseOptions))];

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
          '/user',
          module: UserMenuModule(),
          // guards: [UserAuthGuard()],
        ),
      ];
}
