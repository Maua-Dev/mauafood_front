import '../../domain/entities/meal_entity.dart';
import '../../domain/enum/meal_enum.dart';

class MealModel extends Meal {
  const MealModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.price,
      super.prepareTime,
      required super.type});

  factory MealModel.fromMap(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      prepareTime: json['prepareTime'] ?? '',
      type: MealEnumExtension.stringToEnumMap(json['type']),
    );
  }

  static List<MealModel> fromMaps(List array) {
    return array.map((e) => MealModel.fromMap(e)).toList();
  }
}
