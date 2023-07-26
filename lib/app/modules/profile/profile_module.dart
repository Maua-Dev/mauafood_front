import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/ui/pages/favorites_page.dart';
import 'package:mauafood_front/app/modules/profile/ui/pages/profile_page.dart';

import 'controllers/profile_controller.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [Bind.lazySingleton((i) => ProfileController(i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const ProfilePage(),
        ),
        ChildRoute(
          '/favorites/',
          child: (context, args) => const FavoritesPage(),
        ),
      ];
}
