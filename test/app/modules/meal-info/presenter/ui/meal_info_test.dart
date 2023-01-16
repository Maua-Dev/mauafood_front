import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/cart/presenter/bloc/cart_bloc.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/meal_info_page.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  final CartBloc cartBloc = CartBloc();

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
  });

  testWidgets('[WIDGETS TEST] - MealInfoPage', (widgetTester) async {
    mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(MaterialApp(
        home: MealInfoPage(
          bloc: cartBloc,
          mealInfo: testMock,
        ),
      ));

      final elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsAtLeastNWidgets(3));
      final circularProgress = find.byType(CircularProgressIndicator);
      expect(circularProgress, findsNothing);
      final center = find.byType(Center);
      expect(center, findsWidgets);
      final sizedBox = find.byType(SizedBox);
      expect(sizedBox, findsAtLeastNWidgets(5));
      final texts = find.byType(Text);
      expect(texts, findsAtLeastNWidgets(4));
      final columns = find.byType(Column);
      expect(columns, findsNWidgets(6));
      final rows = find.byType(Row);
      expect(rows, findsNWidgets(7));
      final containers = find.byType(Container);
      expect(containers, findsNWidgets(5));
      final image = find.byType(Image);
      expect(image, findsNWidgets(4));
      final icon = find.byType(Icon);
      expect(icon, findsNWidgets(7));
      final listView = find.byType(ListView);
      expect(listView, findsNothing);
    });
  });
}
