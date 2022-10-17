import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mauafood_front/app/modules/menu/infra/datasources/menu_datasource_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';

class MenuDatasourceImpl implements MenuDatasourceInterface {
  @override
  Future<List<MealModel>> readJson() async {
    try {
      const String path = 'assets/data/restaurant.json';
      final jsonString = await rootBundle.loadString(path);
      final listOfJsonElements = json.decode(jsonString) as List;
      return MealModel.fromMaps(listOfJsonElements);
    } catch (e) {
      throw Exception();
    }
  }
}
