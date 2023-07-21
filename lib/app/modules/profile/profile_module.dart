import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/ui/pages/favorites_page.dart';
import 'package:mauafood_front/app/modules/profile/ui/pages/profile_page.dart';

class ProfileModule extends Module {
  // @override
  // List<Module> get imports => [AuthModule()];
  @override
  List<Bind> get binds => [
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => ProfilePage(),
          // guards: [UserAuthGuard()],
        ),
        ChildRoute(
          '/favorites/',
          child: (context, args) => const FavoritesPage(),
          // guards: [UserAuthGuard()],
        ),
      ];
}
