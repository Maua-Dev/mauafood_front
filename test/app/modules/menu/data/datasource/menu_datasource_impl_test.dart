import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/menu/data/datasource/menu_datasource_impl.dart';
import 'package:mauafood_front/app/modules/menu/infra/datasources/menu_datasource_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mauafood_front/app/modules/menu/menu_module.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initModules([AppModule(), MenuModule()]);
  late MenuDatasourceInterface datasource;

  // String mockJson = r'''[
  //   {
  //     "id": 0,
  //     "name": "Macarronada",
  //     "description":
  //         "Servido de forma rápida esse prato possui diversos ingredientes. Feito para quem busca o melhor da gastronomia com o melhor preço.",
  //     "price": 25.99,
  //     "prepareTime": 20,
  //     "type": "LANCHE"
  //   },
  //   {
  //     "id": 1,
  //     "name": "Refrigerante",
  //     "description":
  //         "Servido de forma rápida esse prato possui diversos ingredientes. Feito para quem busca o melhor da gastronomia com o melhor preço.",
  //     "price": 25.99,
  //     "prepareTime": 20,
  //     "type": "BEBIDA"
  //   },
  //   {
  //     "id": 2,
  //     "name": "Macarronada",
  //     "description":
  //         "Servido de forma rápida esse prato possui diversos ingredientes. Feito para quem busca o melhor da gastronomia com o melhor preço.",
  //     "price": 25.99,
  //     "prepareTime": 20,
  //     "type": "LANCHE"
  //   }
  // ]''';

  setUp(() {
    datasource = MenuDatasourceImpl();
  });
  group('[TEST] - getMeals from json assets ', () {
    test('returns correct a List<MealModel>', () async {
      List<MealModel> data = await datasource.readJson();
      expect(data, isA<List<MealModel>>());
    });

    // test('returns Exception', () async {
    //   when(await rootBundle.loadString('assets/data/restaurant.json'))
    //       .thenAnswer(
    //     (realInvocation) => mockJson,
    //   );
    //   expect(await datasource.readJson(), throwsA(Exception()));
    // });
  });
}
