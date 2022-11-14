import 'package:mauafood_front/app/modules/cart/domain/entities/cart_item_entity.dart';

import '../../../menu/infra/models/meal_model.dart';

class CartItemModel extends CartItem {
  const CartItemModel(
      {required super.meal, required super.quantity, required super.id});

  Map<String, dynamic> toJson() => {
        'meal': meal.toJson(),
        'quantity': quantity,
      };
  CartItemModel copyWith({
    MealModel? meal,
    String? id,
    int? quantity,
  }) {
    return CartItemModel(
      meal: meal ?? this.meal,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
    );
  }
}
