import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/domain/usecases/get_restaurant_meal.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mauafood_front/app/modules/menu/menu_module.dart';
import 'package:mauafood_front/app/modules/menu/presenter/bloc/menu_bloc.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/menu_page.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/widgets/appbar/menu_appbar_widget.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/widgets/meal_card_widget.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'menu_page_test.mocks.dart';

@GenerateMocks([GetRestaurantMealInterface])
void main() {
  initModules([AppModule(), MenuModule()]);
  GetRestaurantMealInterface getRestaurantMeal =
      MockGetRestaurantMealInterface();
  late MenuBloc bloc;
  var restaurantEnum = RestaurantEnum.restaurantBiba;

  MealModel testMock = const MealModel(
    id: 0,
    name: 'name',
    description: 'description',
    price: 10,
    type: MealEnum.bebida,
    photo: '',
  );
  var listMock = [
    testMock,
    const MealModel(
      id: 0,
      name: 'any',
      description: 'description',
      price: 10,
      type: MealEnum.lanche,
      photo: '',
    ),
  ];
  setUpAll(() {
    HttpOverrides.global = null;
    bloc = MenuBloc(
        getRestaurantMeal: getRestaurantMeal, restaurantInfo: restaurantEnum);
  });

  tearDown(() {
    bloc.close();
  });

  testWidgets('[WIDGETS TEST] - MenuPage must show widgets in bloc states',
      (widgetTester) async {
    when(getRestaurantMeal())
        .thenAnswer((realInvocation) async => Right(listMock));

    await widgetTester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (context) => bloc,
        child: const MenuPage(),
      ),
    ));

    final appbar = find.byType(MenuAppbarWidget);
    expect(appbar, findsOneWidget);
    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsNothing);
    final listViewVertical = find.byType(ListView);
    expect(listViewVertical, findsNothing);
    final gridView = find.byType(GridView);
    expect(gridView, findsNothing);
    final mealCards = find.byType(MealCardWidget);
    expect(mealCards, findsNWidgets(0));

    await widgetTester.runAsync(() async => bloc.add(GetAllMealsEvent()));
    await widgetTester.pump();

    expect(appbar, findsOneWidget);
    expect(textField, findsOneWidget);
    expect(loading, findsNothing);
    expect(listViewVertical, findsOneWidget);
    expect(gridView, findsOneWidget);
    expect(mealCards, findsAtLeastNWidgets(2));
  });
}
