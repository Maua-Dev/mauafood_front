import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/repositories/menu_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';

abstract class ICreateProductUsecase {
  Future<Either<Failure, void>> call(
      ProductModel product, RestaurantEnum restaurant);
}

class CreateProductUsecase extends ICreateProductUsecase {
  final IMenuRepository repository;

  CreateProductUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(
      ProductModel product, RestaurantEnum restaurant) async {
    var result = await repository.createProduct(product, restaurant);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
