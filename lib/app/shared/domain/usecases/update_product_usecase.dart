import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/repositories/menu_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';

abstract class IUpdateProductUsecase {
  Future<Either<Failure, ProductModel>> call(
      ProductModel product, RestaurantEnum restaurant);
}

class UpdateProductUsecase extends IUpdateProductUsecase {
  final IMenuRepository repository;

  UpdateProductUsecase({required this.repository});

  @override
  Future<Either<Failure, ProductModel>> call(
      ProductModel product, RestaurantEnum restaurant) async {
    var result = await repository.updateProduct(product, restaurant);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
