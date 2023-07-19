import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';

abstract class IMenuDatasource {
  Future<Map<String, dynamic>> getAllProducts();
  Future<void> createProduct(ProductModel product, RestaurantEnum restaurant);
  Future<void> updateProduct(ProductModel product, RestaurantEnum restaurant);
  Future<void> deleteProduct(String id, RestaurantEnum restaurant);
}
