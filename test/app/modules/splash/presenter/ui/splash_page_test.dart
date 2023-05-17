import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/splash/presenter/controllers/splash_controller.dart';
import 'package:mauafood_front/app/modules/splash/presenter/states/splash_state.dart';
import 'package:mauafood_front/app/modules/splash/presenter/ui/pages/splash_page.dart';
import 'package:mauafood_front/app/modules/splash/splash_module.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

void main() {
  late SplashController controller;

  setUpAll(() {
    HttpOverrides.global = null;
    initModules([
      SplashModule()
    ], replaceBinds: [
      modular.Bind<SplashController>((i) => controller),
    ]);
    controller = Modular.get<SplashController>();
  });
  testWidgets('[WIDGETS TEST] - SplashPage must show widgets in states',
      (widgetTester) async {
    await mockNetworkImagesFor(() async {
      await widgetTester
          .runAsync(() async => await widgetTester.pumpWidget(const MaterialApp(
                home: SplashPage(),
              )));

      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(Image), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await widgetTester
          .runAsync(() async => controller.changeState(SplashLoadingState()));
      await widgetTester.pump();

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
