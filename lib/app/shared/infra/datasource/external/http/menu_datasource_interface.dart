import 'dart:io';

import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';

abstract class IMenuDatasource {
  Future<Map<String, dynamic>> getAllProducts();
  Future<ProductModel> createProduct(
      ProductModel product, RestaurantEnum restaurant);
  Future<ProductModel> updateProduct(
      ProductModel product, RestaurantEnum restaurant);
  Future<void> deleteProduct(String id, RestaurantEnum restaurant);
  Future<String> uploadProductPhoto(String id);
  Future<void> uploadPhotoToS3(String url, File photo);
}
