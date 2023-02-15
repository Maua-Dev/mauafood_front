import '../../domain/entities/meal_entity.dart';
import '../../domain/enum/meal_enum.dart';

class MealModel extends Meal {
  const MealModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.price,
      super.prepareTime,
      required super.type,
      required super.photo});

  factory MealModel.fromMap(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      prepareTime: json['prepare_time'],
      type: MealEnumExtension.stringToEnumMap(json['meal_type']),
      photo: json['photo'],
    );
  }

  static List<MealModel> fromMaps(List array) {
    return array.map((e) => MealModel.fromMap(e)).toList();
  }
}
