import '../enum/meal_enum.dart';

class Meal {
  final String id;
  final String name;
  final String description;
  final double price;
  final String photo;
  final int? prepareTime;
  final MealEnum type;
  final bool available;
  final DateTime lastUpdate;

  const Meal({
    required this.lastUpdate,
    required this.available,
    required this.photo,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.prepareTime,
    required this.type,
  });
}
