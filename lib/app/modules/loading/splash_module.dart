import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/loading/presenter/ui/splash_page.dart';

class LoadingModule extends Module {
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
