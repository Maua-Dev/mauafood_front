import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/splash/presenter/ui/splash_page.dart';

import '../auth/auth_module.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        ),
      ];
}
