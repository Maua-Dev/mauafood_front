import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/favorites_page.dart';
import 'package:mauafood_front/app/modules/profile/profile_page.dart';

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
          child: (context, args) => const ProfilePage(),
          // guards: [UserAuthGuard()],
        ),
        ChildRoute(
          '/favorites/',
          child: (context, args) => const FavoritesPage(),
          // guards: [UserAuthGuard()],
        ),
      ];
}
