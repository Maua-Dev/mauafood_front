import 'package:mauafood_front/app/modules/splash/presenter/ui/states/splash_state.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  @observable
  SplashState state = SplashInitialState();

  @action
  void changeState(SplashState value) => state = value;

  @action
  Future<void> loadSplash() async {
    changeState(SplashLoadingState());
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      changeState(SplashSuccessState());
    });
  }
}
