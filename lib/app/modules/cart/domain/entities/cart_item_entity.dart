import 'package:equatable/equatable.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';

class CartItem extends Equatable {
  final Meal meal;
  final int quantity;

  const CartItem({required this.meal, required this.quantity});

  @override
  List<Object?> get props => [meal, quantity];
}
