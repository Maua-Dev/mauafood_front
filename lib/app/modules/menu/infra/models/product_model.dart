import '../../../../shared/domain/enums/product_enum.dart';
import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.price,
      super.prepareTime,
      required super.type,
      required super.photo,
      required super.available,
      required super.lastUpdate});

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
}
