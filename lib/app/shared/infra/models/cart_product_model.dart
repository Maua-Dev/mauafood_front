import 'package:mauafood_front/app/shared/domain/entities/cart_product.dart';

class CartProductModel extends CartProduct {
  CartProductModel({
    required super.id,
    required super.name,
    required super.quantity,
    required super.observation,
    required super.price,
    required super.photo,
  });

  factory CartProductModel.newInstance() {
    return CartProductModel(
      id: '',
      name: '',
      observation: '',
      quantity: 1,
      photo: '',
      price: 0,
    );
  }

  CartProductModel copyWith({
    String? id,
    String? name,
    String? observation,
    int? quantity,
    double? price,
    String? photo,
  }) {
    return CartProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        observation: observation ?? this.observation,
        price: price ?? this.price,
        photo: photo ?? this.photo);
  }
}
