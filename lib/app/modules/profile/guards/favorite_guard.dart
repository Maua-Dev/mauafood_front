import 'dart:async';

import 'package:auth_package/core/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/profile_module.dart';

class FavoriteGuard extends RouteGuard {
  final AuthStore authStore = Modular.get();
  FavoriteGuard() : super(redirectTo: '/login/');
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    await Modular.isModuleReady<ProfileModule>();
    return Modular.get<AuthStore>().isLogged;
  }
}
