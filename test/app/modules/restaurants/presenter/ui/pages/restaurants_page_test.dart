import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/controllers/restaurant_controller.dart';
import 'package:mauafood_front/app/shared/domain/entities/restaurant.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/pages/restaurants_page.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/widgets/restaurant_widget.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurant_module.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'restaurants_page_test.mocks.dart';

@GenerateMocks([RestaurantController])
void main() {
  final store = MockRestaurantController();

  initModules([
    RestaurantModule()
  ], replaceBinds: [
    Bind<RestaurantController>(((i) => store)),
  ]);

  List<Restaurant> mockRestaurants = [
    const Restaurant(restaurantInfo: RestaurantEnum.biba),
    const Restaurant(restaurantInfo: RestaurantEnum.hora_h)
  ];

  setUpAll(() {
    HttpOverrides.global = null;
    when(store.restaurants).thenReturn(mockRestaurants);
  });

  testWidgets('[WIDGETS TEST] - Restaurants Page', (widgetTester) async {
    await mockNetworkImagesFor(() async {
      await widgetTester.runAsync(() async {
        await widgetTester.pumpWidget(MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const RestaurantsPage(),
        ));
        final appbar = find.byType(AppBar);
        expect(appbar, findsOneWidget);

        final restaurantCard = find.byType(RestaurantWidget);
        expect(restaurantCard, findsNWidgets(mockRestaurants.length));
        final texts = find.byType(Text);
        expect(texts, findsNWidgets((mockRestaurants.length * 2) + 1));
      });
    });
  });
}
