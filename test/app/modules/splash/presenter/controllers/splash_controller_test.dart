import 'package:auth_package/core/auth_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/splash/presenter/controllers/splash_controller.dart';
import 'package:mauafood_front/app/modules/splash/presenter/states/splash_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../restaurants/presenter/controllers/restaurant_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthStore>()])
void main() {
  final authStore = MockAuthStore();

  group('[TEST] - SplashControllerTest', () {
    test('change page state', () {
      when(authStore.checkLogin()).thenAnswer((_) async => true);
      final controller = SplashController(authStore);
      controller.changeState(SplashLoadingState());
      expect(controller.state, isInstanceOf<SplashLoadingState>());
    });

    test('loadSplash', () async {
      when(authStore.checkLogin()).thenAnswer((_) async => true);
      final controller = SplashController(authStore);
      await controller.loadSplash();
      expect(controller.state, isInstanceOf<SplashSuccessState>());
    });
  });
}
