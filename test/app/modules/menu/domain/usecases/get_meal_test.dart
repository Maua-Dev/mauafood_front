import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/domain/infra/menu_repository_interface.dart';
import 'package:mauafood_front/app/modules/menu/domain/usecases/get_restaurant_meal.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_meal_test.mocks.dart';

@GenerateMocks([MenuRepositoryInterface])
void main() {
  late GetRestaurantMealInterface useCase;
  MenuRepositoryInterface repository = MockMenuRepositoryInterface();
  var h = RestaurantEnum.restaurantH;
  var biba = RestaurantEnum.restaurantBiba;
  var listMock = [
    Meal(
      id: 0,
      name: 'name',
      description: 'description',
      price: 10,
      type: MealEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    )
  ];

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    useCase = GetRestaurantMealImpl(repository: repository);
  });

  group('[TEST] - GetRestaurantMealImpl from Biba', () {
    test('return List<Meal> if everything is correct', () async {
      when(repository.getBibaMeals()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      when(repository.getHMeals()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      var result = await useCase(biba);
      expect(result.fold(id, id), isA<List<Meal>>());
    });

    test('return EmptyList if json is empty', () async {
      when(repository.getBibaMeals()).thenAnswer(
        (realInvocation) async => const Right(<Meal>[]),
      );
      var result = await useCase(biba);
      expect(result.fold(id, id), isA<EmptyList>());
    });

    test('return DatasourceResultNull if json is null', () async {
      when(repository.getBibaMeals()).thenAnswer(
        (realInvocation) async => Left(DatasourceResultNull(message: '')),
      );
      var result = await useCase(biba);
      expect(result.fold(id, id), isA<DatasourceResultNull>());
    });
  });

  group('[TEST] - GetRestaurantMealHImpl from H', () {
    test('return List<Meal> if everything is correct', () async {
      when(repository.getHMeals()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      when(repository.getHMeals()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      var result = await useCase(h);
      expect(result.fold(id, id), isA<List<Meal>>());
    });

    test('return EmptyList if json is empty', () async {
      when(repository.getHMeals()).thenAnswer(
        (realInvocation) async => const Right(<Meal>[]),
      );
      var result = await useCase(h);
      expect(result.fold(id, id), isA<EmptyList>());
    });

    test('return DatasourceResultNull if json is null', () async {
      when(repository.getHMeals()).thenAnswer(
        (realInvocation) async => Left(DatasourceResultNull(message: '')),
      );
      var result = await useCase(h);
      expect(result.fold(id, id), isA<DatasourceResultNull>());
    });
  });
}
