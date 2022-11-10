import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/cart/presenter/bloc/cart_bloc.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/meal_info_page.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/widgets/meal_list_view_widget.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  late CartBloc bloc;
  MealModel testMock = const MealModel(
    id: 0,
    name: 'name',
    description: 'description',
    price: 10,
    type: MealEnum.bebida,
    photo: '',
  );

  setUpAll(() {
    HttpOverrides.global = null;
    bloc = CartBloc();
  });

  testWidgets('[WIDGETS TEST] - MealInfoPage', (widgetTester) async {
    mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(MaterialApp(
        home: MealInfoPage(
          mealInfo: testMock,
          bloc: bloc,
        ),
      ));

      final elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsOneWidget);
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
