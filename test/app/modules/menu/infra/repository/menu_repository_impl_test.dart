import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/menu/domain/infra/menu_repository_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/datasources/menu_datasource_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/product_model.dart';
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
    "HORA_H": [
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
    "CANTINA_DO_MOLEZA": [
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
  });

  group('[TEST] - getBibaProducts', () {
    when(datasource.getAllProducts())
        .thenAnswer((realInvocation) async => listMock);
    repository = MenuRepositoryImpl(datasource: datasource);

    test('return a List<Product> correct', () async {
      var list = await repository.getBibaProducts();
      expect(list.fold(id, id), isA<List<ProductModel>>());
    });
  });

  group('[TEST] - getHProducts', () {
    when(datasource.getAllProducts())
        .thenAnswer((realInvocation) async => listMock);
    repository = MenuRepositoryImpl(datasource: datasource);
    test('return a List<Product> correct', () async {
      var list = await repository.getHoraHProducts();
      expect(list.fold(id, id), isA<List<ProductModel>>());
    });
  });

  group('[TEST] - getMolezaProducts', () {
    when(datasource.getAllProducts())
        .thenAnswer((realInvocation) async => listMock);
    repository = MenuRepositoryImpl(datasource: datasource);
    test('return a List<Product> correct', () async {
      var list = await repository.getMolezaProducts();
      expect(list.fold(id, id), isA<List<ProductModel>>());
    });
  });
}
