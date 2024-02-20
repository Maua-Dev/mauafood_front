import 'package:auth_package/core/auth_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/splash/presenter/controllers/splash_controller.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../restaurants/presenter/controllers/restaurant_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthStore>()])
void main() {
  final authStore = MockAuthStore();

  group('[TEST] - SplashControllerTest', () {
    test('loadSplash', () async {
      when(authStore.checkLogin()).thenAnswer((_) async => true);
      final controller = SplashController(authStore);
      await controller.loadSplash();
    });
  });
}
