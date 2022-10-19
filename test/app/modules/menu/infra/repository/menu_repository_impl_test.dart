import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/domain/infra/menu_repository_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/datasources/menu_datasource_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mauafood_front/app/modules/menu/infra/repository/menu_repository_impl.dart';
import 'package:mauafood_front/app/modules/menu/menu_module.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'menu_repository_impl_test.mocks.dart';

@GenerateMocks([MenuDatasourceInterface])
void main() {
  initModules([AppModule(), MenuModule()]);

  MenuDatasourceInterface datasource = MockMenuDatasourceInterface();
  late MenuRepositoryInterface repository;
  var listMock = const [
    MealModel(
      id: 0,
      name: 'name',
      description: 'description',
      price: 10,
      type: MealEnum.bebida,
      photo: '',
    ),
  ];

  setUp(() {
    repository = MenuRepositoryImpl(datasource: datasource);
  });

  group('[TEST] - getAllMeals ', () {
    test('return a List<Meal> correct', () async {
      when(datasource.readJson())
          .thenAnswer((realInvocation) async => listMock);
      var list = await repository.getAllMeals();
      expect(list.fold(id, id), isA<List<MealModel>>());
    });

    test('return ErrorReadJson when json is null', () async {
      when(datasource.readJson())
          .thenThrow((realInvocation) async => Exception());
      var list = await repository.getAllMeals();
      expect(list.fold(id, id), isA<DatasourceResultNull>());
    });
  });
}
