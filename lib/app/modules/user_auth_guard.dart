import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/auth/auth_bloc.dart';

import '../app_module.dart';
import '../shared/infra/user_roles_enum.dart';
import 'auth/auth_module.dart';

class UserAuthGuard extends RouteGuard {
  UserAuthGuard()
      : super(
          redirectTo: '/employee/',
        );

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    await Modular.isModuleReady<AuthModule>();
    var authController = Modular.get<AuthBloc>();
    if (!authController.isLoggedIn) {
      await authController.verifyIfHaveTokens();
    }
    if (authController.isLoggedIn &&
        authController.userRole == UserRolesEnum.user) {
      return true;
    }
    return false;
  }
}
