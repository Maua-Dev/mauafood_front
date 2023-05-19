import 'package:flutter_modular/flutter_modular.dart';
import '../../../app_module.dart';
import '../../../shared/domain/enums/user_roles_enum.dart';
import '../../auth/auth_module.dart';
import '../../../shared/domain/storage/auth_storage_interface.dart';

class UserAuthGuard extends RouteGuard {
  UserAuthGuard()
      : super(
          redirectTo: '/login/',
        );

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    await Modular.isModuleReady<AuthModule>();
    var storage = Modular.get<IAuthStorage>();
    if ((await storage.getIdToken()).isNotEmpty) {
      var role =
          UserRolesEnumExtension.stringToEnumMap(await storage.getRole());
      if ((role == UserRolesEnum.USER || role == UserRolesEnum.STUDENT)) {
        return true;
      }
    }
    return false;
  }
}
