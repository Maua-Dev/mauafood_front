import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/home/perfil_page.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/perfil',
          child: (context, args) => const PerfilPage(),
        ),
      ];
}
