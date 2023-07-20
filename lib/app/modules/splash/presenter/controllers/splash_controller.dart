import 'package:auth_package/core/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/splash/presenter/states/splash_state.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  final AuthStore _authStore;
  SplashControllerBase(this._authStore) {
    loadSplash();
  }

  @observable
  SplashState state = SplashInitialState();

  @action
  void changeState(SplashState value) => state = value;

  @action
  Future<void> loadSplash() async {
    changeState(SplashLoadingState());
    final value = await _authStore.checkLogin();
    await Future.delayed(const Duration(seconds: 3));
    !value ? Modular.to.navigate('/login/') : Modular.to.navigate('/user/');
    changeState(SplashSuccessState());
  }
}
