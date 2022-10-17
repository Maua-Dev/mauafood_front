import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;
  final int? prepareTime;
  final String type;

  const Meal({
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
      prepareTime ?? '',
      type,
    ];
  }
}
