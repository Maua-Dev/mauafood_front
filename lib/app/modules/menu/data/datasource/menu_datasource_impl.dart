import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mauafood_front/app/modules/menu/infra/datasources/menu_datasource_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';

class MenuDatasourceImpl implements MenuDatasourceInterface {
  @override
  Future<List<MealModel>> readJsonBiba() async {
    try {
      const String path = 'assets/data/restaurant_biba.json';
      final jsonString = await rootBundle.loadString(path);
      final listOfJsonElements = json.decode(jsonString) as List;
      return MealModel.fromMaps(listOfJsonElements);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<MealModel>> readJsonH() async {
    try {
      const String path = 'assets/data/restaurant_h.json';
      final jsonString = await rootBundle.loadString(path);
      final listOfJsonElements = json.decode(jsonString) as List;
      return MealModel.fromMaps(listOfJsonElements);
    } catch (e) {
      throw Exception();
    }
  }
}
