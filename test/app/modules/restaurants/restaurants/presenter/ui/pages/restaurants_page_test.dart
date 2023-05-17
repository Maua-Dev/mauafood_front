import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/pages/restaurants_page.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/widgets/restaurant_widget.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurant_module.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    HttpOverrides.global = null;
    initModules(
      [RestaurantModule()],
    );
  });
  testWidgets('[WIDGETS TEST] - RestaurantsPage must show widgets in states',
      (widgetTester) async {
    await mockNetworkImagesFor(() async {
      await widgetTester
          .runAsync(() async => await widgetTester.pumpWidget(MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: const RestaurantsPage(),
              )));
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(3));
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(RestaurantWidget), findsNWidgets(2));
    });
  });
}
