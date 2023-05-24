import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/splash/presenter/controllers/splash_controller.dart';
import 'package:mauafood_front/app/modules/splash/presenter/ui/pages/splash_page.dart';

import '../auth/auth_module.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        ),
      ];
}
