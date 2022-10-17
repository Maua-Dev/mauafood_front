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

  setUp(() {
    datasource = MenuDatasourceImpl();
  });

  test('[TEST] - getMeals from json assets', () async {
    List<MealModel> data = await datasource.readJson();
    expect(data, isA<List<MealModel>>());
  });
}
