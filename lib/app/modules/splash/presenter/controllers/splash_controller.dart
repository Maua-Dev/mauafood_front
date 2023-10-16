import 'package:auth_package/core/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  final AuthStore _authStore;
  SplashControllerBase(this._authStore) {
    loadSplash();
  }

  @action
  Future<void> loadSplash() async {
    await _authStore.checkLogin();
    await Future.delayed(const Duration(seconds: 2));
    Modular.to.navigate('/landing/');
  }
}
