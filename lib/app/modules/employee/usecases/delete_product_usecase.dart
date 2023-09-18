import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/repositories/menu_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class IDeleteProductUsecase {
  Future<Either<Failure, void>> call(String id, RestaurantEnum restaurant);
}

class DeleteProductUsecase extends IDeleteProductUsecase {
  final IMenuRepository repository;

  DeleteProductUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(
      String id, RestaurantEnum restaurant) async {
    var result = await repository.deleteProduct(id, restaurant);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
