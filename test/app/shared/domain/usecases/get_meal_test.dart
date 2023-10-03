import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/menu_repository_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_product_test.mocks.dart';

@GenerateMocks([IMenuRepository])
void main() {
  late IGetRestaurantProductUsecase useCase;
  IMenuRepository repository = MockIMenuRepository();
  var h = RestaurantEnum.hora_h;
  var biba = RestaurantEnum.souza_de_abreu;
  var listMock = [
    ProductModel(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: ProductEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    )
  ];

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    useCase = GetRestaurantProductUsecase(repository: repository);
  });

  group('[TEST] - GetRestaurantMealImpl from Biba', () {
    test('return List<Meal> if everything is correct', () async {
      when(repository.getBibaProducts()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      when(repository.getHoraHProducts()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      var result = await useCase(biba);
      expect(result.fold(id, id), isA<List<Product>>());
    });

    test('return EmptyList if json is empty', () async {
      when(repository.getBibaProducts()).thenAnswer(
        (realInvocation) async => const Right(<ProductModel>[]),
      );
      var result = await useCase(biba);
      expect(result.fold(id, id), isA<EmptyList>());
    });

    test('return DatasourceResultNull if json is null', () async {
      when(repository.getBibaProducts()).thenAnswer(
        (realInvocation) async => Left(ErrorRequest(message: '')),
      );
      var result = await useCase(biba);
      expect(result.fold(id, id), isA<ErrorRequest>());
    });
  });

  group('[TEST] - GetRestaurantMealHImpl from H', () {
    test('return List<Meal> if everything is correct', () async {
      when(repository.getHoraHProducts()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      when(repository.getHoraHProducts()).thenAnswer(
        (realInvocation) async => Right(listMock),
      );
      var result = await useCase(h);
      expect(result.fold(id, id), isA<List<Product>>());
    });

    test('return EmptyList if json is empty', () async {
      when(repository.getHoraHProducts()).thenAnswer(
        (realInvocation) async => const Right(<ProductModel>[]),
      );
      var result = await useCase(h);
      expect(result.fold(id, id), isA<EmptyList>());
    });

    test('return DatasourceResultNull if json is null', () async {
      when(repository.getHoraHProducts()).thenAnswer(
        (realInvocation) async => Left(ErrorRequest(message: '')),
      );
      var result = await useCase(h);
      expect(result.fold(id, id), isA<ErrorRequest>());
    });
  });
}
