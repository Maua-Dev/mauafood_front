import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/presenter/ui/user/pages/user_profile_page.dart';

class UserProfileModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const UserProfilePage(),
        ),
      ];
}
