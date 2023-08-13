import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';

abstract class IMenuRepository {
  Future<void> getAllProducts();
  Future<Either<Failure, List<ProductModel>>> getBibaProducts();
  Future<Either<Failure, List<ProductModel>>> getHoraHProducts();
  Future<Either<Failure, List<ProductModel>>> getMolezaProducts();
  Future<Either<Failure, ProductModel>> createProduct(
      ProductModel product, RestaurantEnum restaurant);
  Future<Either<Failure, ProductModel>> updateProduct(
      ProductModel product, RestaurantEnum restaurant);
  Future<Either<Failure, void>> deleteProduct(
      String id, RestaurantEnum restaurant);
}
