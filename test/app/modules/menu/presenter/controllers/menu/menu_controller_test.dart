import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/domain/usecases/get_restaurant_meal.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/menu/menu_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/states/menu_state.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'menu_controller_test.mocks.dart';

@GenerateMocks([GetRestaurantMealInterface])
void main() {
  late MenuController controller;
  GetRestaurantMealInterface usecase = MockGetRestaurantMealInterface();
  RestaurantEnum restaurantInfo = RestaurantEnum.biba;
  var failure = Failure(message: '');
  MealModel testMock = MealModel(
    id: '0',
    name: 'name',
    description: 'description',
    price: 10,
    type: MealEnum.DRINKS,
    photo: '',
    available: true,
    lastUpdate: DateTime.now(),
  );
  var listMock = [
    testMock,
    MealModel(
      id: '0',
      name: '123',
      description: 'description',
      price: 10,
      type: MealEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
  ];
  setUp(() async {
    controller = MenuController(usecase, restaurantInfo);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - loadRestaurantMenu', () {
    test('must return MenuLoadedSuccessState', () async {
      when(usecase.call(restaurantInfo))
          .thenAnswer((_) async => Right(listMock));
      await controller.loadRestaurantMenu();
      expect(controller.state, isA<MenuLoadedSuccessState>());
    });

    test('must return MenuErrorState', () async {
      when(usecase.call(restaurantInfo)).thenAnswer((_) async => Left(failure));
      await controller.loadRestaurantMenu();
      expect(controller.state, isA<MenuErrorState>());
    });
  });

  group('[TEST] - searchMeal', () {
    test('must return MenuLoadedSuccessState', () async {
      controller
          .changeState(MenuLoadedSuccessState(listMeal: listMock, index: 0));
      when(usecase.call(restaurantInfo))
          .thenAnswer((_) async => Right(listMock));
      await controller.searchMeal('name');
      var successState = controller.state as MenuLoadedSuccessState;
      expect(successState.listMeal, [testMock]);
    });

    test('must return MenuErrorState', () async {
      controller.changeState(MenuErrorState(failure: failure));
      when(usecase.call(restaurantInfo)).thenAnswer((_) async => Left(failure));
      await controller.searchMeal('');
      expect(controller.state, isA<MenuErrorState>());
    });
  });

  group('[TEST] - filterMeal', () {
    test('must return MenuLoadedSuccessState', () async {
      controller
          .changeState(MenuLoadedSuccessState(listMeal: listMock, index: 0));
      when(usecase.call(restaurantInfo))
          .thenAnswer((_) async => Right(listMock));
      await controller.filterMeal(MealEnum.DRINKS);
      var successState = controller.state as MenuLoadedSuccessState;
      expect(successState.listMeal, [testMock]);
    });

    test('must return MenuErrorState', () async {
      controller.changeState(MenuErrorState(failure: failure));
      when(usecase.call(restaurantInfo)).thenAnswer((_) async => Left(failure));
      await controller.filterMeal(MealEnum.SNACKS);
      expect(controller.state, isA<MenuErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      controller
          .changeState(MenuLoadedSuccessState(listMeal: listMock, index: 0));
      expect(controller.state, isA<MenuLoadedSuccessState>());
    });
  });
}
