import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mauafood_front/app/modules/restaurants/presenter/ui/pages/restaurants_page.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/widgets/restaurant_widget.dart';

void main(){
  

    setUpAll((){
      HttpOverrides.global = null;
    });


testWidgets('[WIDGETS TEST] - RestaurantsPage', (widgetTester) async{
  mockNetworkImagesFor() async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: RestaurantsPage(
          )
      )
    );
      final appBar = find.byType(AppBar);
      expect(appBar, findsOneWidget);
      final restaurant = find.byType(RestaurantWidget);
      expect(restaurant, findsAtLeastNWidgets(2));
      final iconButton = find.byType(IconButton);
      expect(iconButton, findsOneWidget);
      final elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsAtLeastNWidgets(2));
      final texts = find.byType(Text);
      expect(texts, findsNWidgets(2));
      final sizedBox = find.byType(SizedBox);
      expect(sizedBox, findsOneWidget);
      final padding = find.byType(Padding);
      expect(padding, findsNWidgets(3));
      final container = find.byType(Container);
      expect(container, findsOneWidget);
  }
});

}