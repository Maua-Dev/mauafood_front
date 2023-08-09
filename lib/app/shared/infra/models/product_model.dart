import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

import '../../domain/enums/product_enum.dart';
import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
      {super.id,
      required super.name,
      super.description,
      required super.price,
      super.prepareTime,
      required super.type,
      required super.photo,
      required super.available,
      super.lastUpdate});

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      id: json['product_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      prepareTime: json['prepare_time'],
      type: ProductEnumExtension.stringToEnumMap(json['meal_type']),
      photo: json['photo'],
      available: json['available'],
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(json['last_update']),
    );
  }

  static List<ProductModel> fromMaps(List array) {
    return array.map((e) => ProductModel.fromMap(e)).toList();
  }

  Map<String, dynamic> toJson(RestaurantEnum restaurantEnum) {
    return {
      'available': available,
      'price': price,
      'name': name,
      'description': description,
      'meal_type': EnumToString.convertToString(type).toUpperCase(),
      'photo': photo,
      'restaurant': EnumToString.convertToString(restaurantEnum).toUpperCase(),
      'prepare_time': prepareTime,
    };
  }

  Map<String, dynamic> newProductJson(RestaurantEnum restaurantEnum) {
    return {
      'product_id': id,
      'restaurant': EnumToString.convertToString(restaurantEnum).toUpperCase(),
      'new_available': available,
      'new_price': price,
      'new_name': name,
      'new_description': description,
      'new_prepare_time': prepareTime,
      'new_meal_type': EnumToString.convertToString(type).toUpperCase(),
      'new_photo': photo,
    };
  }
}
