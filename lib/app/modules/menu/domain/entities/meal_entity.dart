import 'package:equatable/equatable.dart';

import '../enum/meal_enum.dart';

class Meal extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String photo;
  final int? prepareTime;
  final MealEnum type;

  const Meal({
    required this.photo,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.prepareTime,
    required this.type,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      price,
      photo,
      prepareTime ?? '',
      type,
    ];
  }
}
