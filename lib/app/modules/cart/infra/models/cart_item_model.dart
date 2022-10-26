import 'package:mauafood_front/app/modules/cart/domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItem {
  const CartItemModel({required super.meal, required super.quantity});

  Map<String, dynamic> toJson() => {
        'meal': meal,
        'quantity': quantity,
      };
}
