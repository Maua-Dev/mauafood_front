import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/domain/infra/menu_repository_interface.dart';
import 'package:mauafood_front/app/modules/menu/domain/usecases/get_meal.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_meal_test.mocks.dart';

@GenerateMocks([MenuRepositoryInterface])
void main() {
  late GetMeal useCase;
  MenuRepositoryInterface repository = MockMenuRepositoryInterface();
  var listMock = const [
    Meal(
        id: 0,
        name: 'name',
        description: 'description',
        price: 10,
        type: 'type'),
  ];

  setUp(() {
    useCase = GetMeal(repository: repository);
  });

  group('[TEST] - getAllMeal ', () {
    test('return List<Meal> if everything is correct', () async {
      when(repository.getAllMeals()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      var result = await useCase();
      expect(result.fold(id, id), isA<List<Meal>>());
    });

    test('return EmptyList if json is empty', () async {
      when(repository.getAllMeals()).thenAnswer(
        (realInvocation) async => const Right(<Meal>[]),
      );
      var result = await useCase();
      expect(result.fold(id, id), isA<EmptyList>());
    });

    test('return DatasourceResultNull if json is null', () async {
      when(repository.getAllMeals()).thenAnswer(
        (realInvocation) async => Left(Failure(message: '')),
      );
      var result = await useCase();
      expect(result.fold(id, id), isA<DatasourceResultNull>());
    });
  });
}
