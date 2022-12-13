import 'package:flutter_modular/flutter_modular.dart';

import '../app_module.dart';
import 'auth/auth_module.dart';
import 'auth/presenter/bloc/auth/auth_bloc.dart';

class EmployeeAuthGuard extends RouteGuard {
  EmployeeAuthGuard()
      : super(
          redirectTo: '/login/',
        );

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    await Modular.isModuleReady<AuthModule>();
    var authController = Modular.get<AuthBloc>();
    if (!authController.isLoggedIn) {
      await authController.verifyIfHaveTokens();
    }
    if (authController.isLoggedIn && authController.userRole == 'EMPLOYEE') {
      return true;
    }
    return false;
  }
}
