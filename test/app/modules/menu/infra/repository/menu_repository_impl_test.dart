import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/domain/infra/menu_repository_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/datasources/menu_datasource_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mauafood_front/app/modules/menu/infra/repository/menu_repository_impl.dart';
import 'package:mauafood_front/app/modules/menu/user_menu_module.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'menu_repository_impl_test.mocks.dart';

@GenerateMocks([MenuDatasourceInterface])
void main() {
  initModules([AppModule(), UserMenuModule()]);

  MenuDatasourceInterface datasource = MockMenuDatasourceInterface();
  late MenuRepositoryInterface repository;
  Map<String, dynamic> listMock = {
    "SOUZA_DE_ABREU": [
      {
        "available": true,
        "price": 28.0,
        "name": "Lasanha",
        "description": "Massa - Mussarela/Presunto/Molho ao sugo",
        "meal_type": "SALADS",
        "photo": "https://avatars.githubusercontent.com/u/30812461?v=4",
        "product_id": "5a39d0ee-06da-4abf-9fc1-40d25bea19e0",
        "last_update": 1674835337393,
        "prepare_time": 20
      },
    ],
    "RESTAURANTE_DO_H": [
      {
        "available": true,
        "price": 36.0,
        "name": "Strogonoff Carne",
        "description": "",
        "meal_type": "PLATES",
        "photo": "https://avatars.githubusercontent.com/u/30812461?v=4",
        "product_id": "44daaa83-d8a3-4507-b807-644be457955c",
        "last_update": 1674835337393,
        "prepare_time": 20
      }
    ],
    "message": "the products were retrieved"
  };

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    repository = MenuRepositoryImpl(datasource: datasource);
  });

  group('[TEST] - getBibaMeals', () {
    test('return a List<Meal> correct', () async {
      when(datasource.getAllProducts())
          .thenAnswer((realInvocation) async => listMock);
      var list = await repository.getBibaMeals();
      expect(list.fold(id, id), isA<List<MealModel>>());
    });

    test('return ErrorReadJson when json is null', () async {
      when(datasource.getAllProducts())
          .thenThrow((realInvocation) async => Exception());
      var list = await repository.getBibaMeals();
      expect(list.fold(id, id), isA<DatasourceResultNull>());
    });
  });

  group('[TEST] - getHMeals', () {
    test('return a List<Meal> correct', () async {
      when(datasource.getAllProducts())
          .thenAnswer((realInvocation) async => listMock);
      var list = await repository.getHMeals();
      expect(list.fold(id, id), isA<List<MealModel>>());
    });

    test('return ErrorReadJson when json is null', () async {
      when(datasource.getAllProducts())
          .thenThrow((realInvocation) async => Exception());
      var list = await repository.getHMeals();
      expect(list.fold(id, id), isA<DatasourceResultNull>());
    });
  });
}
