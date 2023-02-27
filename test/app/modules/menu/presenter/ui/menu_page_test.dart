import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/domain/usecases/get_restaurant_meal.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/widgets/meal_card_widget.dart';
import 'package:mauafood_front/app/modules/menu/user_menu_module.dart';
import 'package:mauafood_front/app/modules/menu/presenter/bloc/menu_bloc.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/pages/user_menu_page.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'menu_page_test.mocks.dart';

@GenerateMocks([GetRestaurantMealInterface])
void main() {
  GetRestaurantMealInterface getRestaurantMeal =
      MockGetRestaurantMealInterface();
  late MenuBloc bloc;
  var restaurantEnum = RestaurantEnum.restaurantBiba;

  MealModel testMock = MealModel(
    id: '0',
    name: 'name',
    description: 'description',
    price: 10,
    type: MealEnum.CANDIES,
    photo: '',
    available: true,
    lastUpdate: DateTime.now(),
  );
  var listMock = [
    testMock,
    MealModel(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: MealEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
  ];
  setUpAll(() {
    HttpOverrides.global = null;
    bloc = MenuBloc(
        getRestaurantMeal: getRestaurantMeal, restaurantInfo: restaurantEnum);
    initModules([
      UserMenuModule()
    ], replaceBinds: [
      modular.Bind<MenuBloc>((i) => bloc),
    ]);
  });

  tearDown(() {
    bloc.close();
  });

  testWidgets('[WIDGETS TEST] - MenuPage must show widgets in bloc states',
      (widgetTester) async {
    mockNetworkImagesFor(() async {
      when(getRestaurantMeal(bloc.restaurantInfo))
          .thenAnswer((realInvocation) async => Right(listMock));

      await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: BlocProvider(
          create: (context) => bloc,
          child: const UserMenuPage(
            restaurantInfo: RestaurantEnum.restaurantBiba,
          ),
        ),
      ));

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
      final floatingButton = find.byType(FloatingActionButton);
      expect(floatingButton, findsOneWidget);
      final iconFloatingButton = find.byIcon(Icons.mail);
      expect(iconFloatingButton, findsOneWidget);

      await widgetTester.runAsync(() async => bloc.add(GetAllMealsEvent()));
      await widgetTester.pump();

      expect(textField, findsNothing);
      expect(loading, findsNothing);
      expect(listViewVertical, findsNothing);
      expect(gridView, findsNothing);
      expect(mealCards, findsNothing);
    });
  });
}
