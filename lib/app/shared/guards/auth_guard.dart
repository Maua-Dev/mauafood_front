import 'package:auth_package/core/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';

class AuthGuard extends RouteGuard {
  AuthGuard({String redirectTo = '/login/'}) : super(redirectTo: redirectTo);
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return Modular.get<AuthStore>().isLogged;
  }
}
