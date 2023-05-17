import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/splash/presenter/controllers/splash_controller.dart';
import 'package:mauafood_front/app/modules/splash/presenter/ui/states/splash_state.dart';

void main() {
  group('[TEST] - SplashControllerTest', () {
    test('init controller', () {
      final controller = SplashController();
      expect(controller.state, isInstanceOf<SplashInitialState>());
    });

    test('change page state', () {
      final controller = SplashController();
      controller.changeState(SplashLoadingState());
      expect(controller.state, isInstanceOf<SplashLoadingState>());
    });

    test('loadSplash', () async {
      final controller = SplashController();
      await controller.loadSplash();
      expect(controller.state, isInstanceOf<SplashSuccessState>());
    });
  });
}
