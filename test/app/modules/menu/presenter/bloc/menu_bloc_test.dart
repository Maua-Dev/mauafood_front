import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/domain/usecases/get_restaurant_meal.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mauafood_front/app/modules/menu/user_menu_module.dart';
import 'package:mauafood_front/app/modules/menu/presenter/bloc/menu_bloc.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'menu_bloc_test.mocks.dart';

@GenerateMocks([GetRestaurantMealInterface])
void main() {
  initModules([AppModule(), UserMenuModule()]);

  GetRestaurantMealInterface getRestaurantMeal =
      MockGetRestaurantMealInterface();
  late MenuBloc bloc;
  var failure = Failure(message: '');
  var restaurantEnumMock = RestaurantEnum.restaurantBiba;
  MealModel testMock = MealModel(
    id: 0,
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
      id: 0,
      name: 'name',
      description: 'description',
      price: 10,
      type: MealEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
  ];

  setUp(() {
    bloc = MenuBloc(
        getRestaurantMeal: getRestaurantMeal,
        restaurantInfo: restaurantEnumMock);
  });

  group('[TEST] - GetAllMealsEvent ', () {
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(getRestaurantMeal(bloc.restaurantInfo))
            .thenAnswer((realInvocation) async => Right(listMock));
        bloc.add(GetAllMealsEvent());
      },
      expect: () => [
        MenuLoadingState(),
        MenuLoadedSuccessState(listMeal: listMock, index: 0)
      ],
    );

    blocTest(
      'returns error state',
      build: () => bloc,
      act: (bloc) {
        when(getRestaurantMeal(bloc.restaurantInfo))
            .thenAnswer((realInvocation) async => Left(failure));
        bloc.add(GetAllMealsEvent());
      },
      expect: () => [
        MenuLoadingState(),
        MenuErrorState(failure: failure),
      ],
    );
  });

  group('[TEST] - SearchMealEvent ', () {
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(getRestaurantMeal(bloc.restaurantInfo))
            .thenAnswer((realInvocation) async => Right(listMock));
        bloc.eitherListMeal = Right(listMock);
        bloc.add(const SearchMealEvent(search: 'name'));
      },
      expect: () => [
        MenuLoadingState(),
        MenuLoadedSuccessState(listMeal: [testMock], index: 0)
      ],
    );

    blocTest(
      'returns error state',
      build: () => bloc,
      act: (bloc) {
        when(getRestaurantMeal(bloc.restaurantInfo))
            .thenAnswer((realInvocation) async => Left(failure));
        bloc.eitherListMeal = Left(failure);
        bloc.add(const SearchMealEvent(search: ''));
      },
      expect: () => [
        MenuLoadingState(),
        MenuErrorState(failure: failure),
      ],
    );
  });

  group('[TEST] - FilterMealTypeEvent', () {
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(getRestaurantMeal(bloc.restaurantInfo))
            .thenAnswer((realInvocation) async => Right(listMock));
        bloc.eitherListMeal = Right(listMock);
        bloc.add(const FilterMealTypeEvent(mealType: MealEnum.DRINKS));
      },
      expect: () => [
        MenuLoadingState(),
        MenuLoadedSuccessState(
            listMeal: [testMock], index: MealEnum.DRINKS.index)
      ],
    );

    blocTest(
      'returns error state',
      build: () => bloc,
      act: (bloc) {
        when(getRestaurantMeal(bloc.restaurantInfo))
            .thenAnswer((realInvocation) async => Left(failure));
        bloc.eitherListMeal = Left(failure);
        bloc.add(const FilterMealTypeEvent(mealType: MealEnum.DRINKS));
      },
      expect: () => [
        MenuLoadingState(),
        MenuErrorState(failure: failure),
      ],
    );
  });

  group('[TEST] - ChangeRestaurantEvent', () {
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(getRestaurantMeal(bloc.restaurantInfo))
            .thenAnswer((realInvocation) async => Right(listMock));
        bloc.eitherListMeal = Right(listMock);
        bloc.add(const ChangeRestaurantEvent(
            restaurantEnum: RestaurantEnum.restaurantBiba));
      },
      expect: () => [
        MenuLoadingState(),
        MenuLoadedSuccessState(listMeal: listMock, index: 0)
      ],
    );

    blocTest(
      'returns error state',
      build: () => bloc,
      act: (bloc) {
        when(getRestaurantMeal(bloc.restaurantInfo))
            .thenAnswer((realInvocation) async => Left(failure));
        bloc.eitherListMeal = Left(failure);
        bloc.add(const ChangeRestaurantEvent(
            restaurantEnum: RestaurantEnum.restaurantBiba));
      },
      expect: () => [
        MenuLoadingState(),
        MenuErrorState(failure: failure),
      ],
    );
  });
}
