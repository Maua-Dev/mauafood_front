import '../models/meal_model.dart';

abstract class MenuDatasourceInterface {
  Future<List<MealModel>> readJson();
}
