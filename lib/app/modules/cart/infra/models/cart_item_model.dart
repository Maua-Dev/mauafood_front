import 'package:mauafood_front/app/modules/cart/domain/entities/cart_item_entity.dart';

import '../../../menu/infra/models/meal_model.dart';

class CartItemModel extends CartItem {
  const CartItemModel({required super.meal, required super.quantity});

  Map<String, dynamic> toJson() => {
        'meal': meal.toJson(),
        'quantity': quantity,
      };
  CartItemModel copyWith({
    MealModel? meal,
    String? activityCode,
    int? quantity,
  }) {
    return CartItemModel(
        meal: meal ?? this.meal, quantity: quantity ?? this.quantity);
  }
}
