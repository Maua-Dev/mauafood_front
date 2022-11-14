import 'package:equatable/equatable.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';

class CartItem extends Equatable {
  final MealModel meal;
  final int quantity;
  final String id;

  const CartItem(
      {required this.id, required this.meal, required this.quantity});

  @override
  List<Object?> get props => [meal, quantity];
}
