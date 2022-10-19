import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/domain/infra/menu_repository_interface.dart';
import 'package:mauafood_front/app/modules/menu/domain/usecases/get_restaurant_meal.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_meal_test.mocks.dart';

@GenerateMocks([MenuRepositoryInterface])
void main() {
  late GetRestaurantMealInterface useCase1;
  late GetRestaurantMealInterface useCase2;
  MenuRepositoryInterface repository = MockMenuRepositoryInterface();
  var listMock = const [
    Meal(
      id: 0,
      name: 'name',
      description: 'description',
      price: 10,
      type: MealEnum.bebida,
      photo: '',
    ),
  ];

  setUp(() {
    useCase1 = GetRestaurantMealBibaImpl(repository: repository);
    useCase2 = GetRestaurantMealHImpl(repository: repository);
  });

  group('[TEST] - GetRestaurantMealBibaImpl ', () {
    test('return List<Meal> if everything is correct', () async {
      when(repository.getBibaMeals()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      when(repository.getHMeals()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      var result = await useCase1();
      expect(result.fold(id, id), isA<List<Meal>>());
    });

    test('return EmptyList if json is empty', () async {
      when(repository.getBibaMeals()).thenAnswer(
        (realInvocation) async => const Right(<Meal>[]),
      );
      var result = await useCase1();
      expect(result.fold(id, id), isA<EmptyList>());
    });

    test('return DatasourceResultNull if json is null', () async {
      when(repository.getBibaMeals()).thenAnswer(
        (realInvocation) async => Left(DatasourceResultNull(message: '')),
      );
      var result = await useCase1();
      expect(result.fold(id, id), isA<DatasourceResultNull>());
    });
  });

  group('[TEST] - GetRestaurantMealHImpl ', () {
    test('return List<Meal> if everything is correct', () async {
      when(repository.getHMeals()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      when(repository.getHMeals()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      var result = await useCase2();
      expect(result.fold(id, id), isA<List<Meal>>());
    });

    test('return EmptyList if json is empty', () async {
      when(repository.getHMeals()).thenAnswer(
        (realInvocation) async => const Right(<Meal>[]),
      );
      var result = await useCase2();
      expect(result.fold(id, id), isA<EmptyList>());
    });

    test('return DatasourceResultNull if json is null', () async {
      when(repository.getHMeals()).thenAnswer(
        (realInvocation) async => Left(DatasourceResultNull(message: '')),
      );
      var result = await useCase2();
      expect(result.fold(id, id), isA<DatasourceResultNull>());
    });
  });
}
