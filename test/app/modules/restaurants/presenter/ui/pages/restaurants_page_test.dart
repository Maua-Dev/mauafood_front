import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/entities/restaurant_entity.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/usecases/get_restaurant.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/pages/restaurants_page.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/widgets/restaurant_widget.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurant_module.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'restaurants_page_test.mocks.dart';

@GenerateMocks([GetRestaurantInterface])
void main() {
  initModules(
    [AppModule(), RestaurantModule()],
  );
  GetRestaurantInterface getRestaurant = MockGetRestaurantInterface();

  List<Restaurant> mockRestaurants = [
    const Restaurant(restaurantInfo: RestaurantEnum.restaurantBiba),
    const Restaurant(restaurantInfo: RestaurantEnum.restaurantH)
  ];

  setUpAll(() {
    HttpOverrides.global = null;
    when(getRestaurant()).thenAnswer((realInvocation) => mockRestaurants);
  });

  testWidgets('[WIDGETS TEST] - Restaurants Page', (widgetTester) async {
    mockNetworkImagesFor(() async {
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
      final image = find.byType(Image);
      expect(image, findsNWidgets(mockRestaurants.length + 1));
      final restaurantCard = find.byType(RestaurantWidget);
      expect(restaurantCard, findsNWidgets(mockRestaurants.length));
      final texts = find.byType(Text);
      expect(texts, findsNWidgets((mockRestaurants.length * 2) + 1));
    });
  });
}
