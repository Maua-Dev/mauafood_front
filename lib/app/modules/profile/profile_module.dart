import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/guards/favorite_guard.dart';
import 'package:mauafood_front/app/modules/profile/ui/pages/favorites_page.dart';
import 'package:mauafood_front/app/modules/profile/ui/pages/profile_page.dart';
import 'package:mauafood_front/app/modules/user/domain/usecases/update_user.dart';

import 'controllers/profile_controller.dart';
import 'external/hive_datasource.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => UpdatePhotoImpl(i())),
        Bind.lazySingleton((i) => ProfileController(i(), i())),
        AsyncBind<HiveDatasource>((i) => HiveDatasource.instance(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const ProfilePage(),
        ),
        ChildRoute('/favorites/',
            child: (context, args) => const FavoritesPage(),
            guards: [FavoriteGuard()]),
      ];
}
