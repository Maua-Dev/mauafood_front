import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/pages/product_info_page.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/product_entity.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  var recommendedMealList = [
    Product(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: MealEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
    Product(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: MealEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
    Product(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: MealEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    )
  ];
  Product testMock = Product(
    id: '0',
    name: 'name',
    description: 'description',
    price: 10,
    type: MealEnum.CANDIES,
    photo: '',
    available: true,
    lastUpdate: DateTime.now(),
  );

  setUpAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('[WIDGETS TEST] - MealInfoPage', (widgetTester) async {
    mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: ProductInfoPage(
          mealInfo: testMock,
          recommendedMealList: recommendedMealList,
        ),
      ));

      await widgetTester.pump();

      final elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsNWidgets(3));
      final center = find.byType(Center);
      expect(center, findsWidgets);
      final sizedBox = find.byType(SizedBox);
      expect(sizedBox, findsAtLeastNWidgets(5));
      final texts = find.byType(Text);
      expect(texts, findsAtLeastNWidgets(4));
      final columns = find.byType(Column);
      expect(columns, findsNWidgets(8));
      final rows = find.byType(Row);
      expect(rows, findsNWidgets(1));
    });
  });
}
