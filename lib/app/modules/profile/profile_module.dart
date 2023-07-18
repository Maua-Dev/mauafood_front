import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/auth_module.dart';
import 'package:mauafood_front/app/modules/profile/favorites/presenter/favorites_page.dart';
import 'package:mauafood_front/app/modules/profile/presenter/profile_controller.dart';
import 'package:mauafood_front/app/modules/profile/presenter/profile_page.dart';


class ProfileModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];
  @override
  List<Bind> get binds => [
        Bind<ProfileController>((i) => ProfileController(
             
            ))
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