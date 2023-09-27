import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';

class FavoriteViewModel extends Product {
  final String restaurant;

  FavoriteViewModel(
      {super.lastUpdate,
      required super.available,
      required super.photo,
      super.id,
      required super.name,
      required super.description,
      required super.price,
      super.prepareTime,
      required super.type,
      required this.restaurant});

  static List<FavoriteViewModel> fromProductsRestaurants(
      List<Product> products, String restaurant) {
    return products
        .map((e) => FavoriteViewModel(
              available: e.available,
              description: e.description,
              name: e.name,
              photo: e.photo,
              price: e.price,
              type: e.type,
              restaurant: restaurant,
            ))
        .toList();
  }

  factory FavoriteViewModel.fromMap(
      Map<String, dynamic> json, String restaurant) {
    return FavoriteViewModel(
      id: json['product_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      prepareTime: json['prepare_time'],
      type: ProductEnumExtension.stringToEnumMap(json['meal_type']),
      photo: json['photo'],
      available: json['available'],
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(json['last_update']),
      restaurant: restaurant,
    );
  }

  static List<FavoriteViewModel> fromMaps(List array, String restaurant) {
    return array.map((e) => FavoriteViewModel.fromMap(e, restaurant)).toList();
  }
}
