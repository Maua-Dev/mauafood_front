import 'package:auth_package/login.dart';
import 'package:dio/dio.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'modules/landing/landing_module.dart';
import 'package:mauafood_front/app/modules/employee/employee_menu_module.dart';
import 'modules/user/user_menu_module.dart';
import 'package:mauafood_front/amplifyconfiguration.dart';
import 'package:mauafood_front/app/shared/helpers/services/dio/auth_interceptor.dart';

import 'modules/splash/splash_module.dart';
import 'shared/helpers/services/dio/dio_http_request.dart';
import 'shared/helpers/services/dio/options/product_base_options.dart';
import 'shared/helpers/services/http/http_request_interface.dart';


class AppModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule(amplifyconfig)];

  @override
  List<Bind<Object>> get binds => [
        Bind((i) =>
            Dio(productBaseOptions)..interceptors.add(AuthInterceptor())),
        Bind<IHttpRequest>((i) => DioHttpRequest(dio: i<Dio>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: SplashModule(),
        ),
        ModuleRoute('/login',
            module: MicroAppLoginModule(), guards: [LoginGuard()]),
        ModuleRoute(
          '/employee',
          module: EmployeeMenuModule(),
        ),
        ModuleRoute(
          '/user',
          module: UserMenuModule(),
        ),
        ModuleRoute('/landing', module: LandingModule()),
      ];
}