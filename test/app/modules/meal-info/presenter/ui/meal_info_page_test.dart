import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/pages/meal_info_page.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/widgets/meal_list_view_widget.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  var recommendedMealList = [
    Meal(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: MealEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
    Meal(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: MealEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
    Meal(
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
  Meal testMock = Meal(
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
        home: MealInfoPage(
          mealInfo: testMock,
          recommendedMealList: recommendedMealList,
        ),
      ));

      final elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsOneWidget);
      final circularProgress = find.byType(CircularProgressIndicator);
      expect(circularProgress, findsNothing);
      final center = find.byType(Center);
      expect(center, findsWidgets);
      final sizedBox = find.byType(SizedBox);
      expect(sizedBox, findsAtLeastNWidgets(5));
      final texts = find.byType(Text);
      expect(texts, findsAtLeastNWidgets(4));
      final columns = find.byType(Column);
      expect(columns, findsNWidgets(2));
      final rows = find.byType(Row);
      expect(rows, findsNWidgets(1));
      final listView = find.byType(ListView);
      expect(listView, findsOneWidget);
      final mealListView = find.byType(RecommendationCardWidget);
      expect(mealListView, findsNWidgets(3));
    });
  });
}
