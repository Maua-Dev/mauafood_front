import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/product_entity.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../errors/errors.dart';
import '../infra/menu_repository_interface.dart';

abstract class GetRestaurantMealInterface {
  Future<Either<Failure, List<Product>>> call(RestaurantEnum restaurantInfo);
}

class GetRestaurantMealImpl implements GetRestaurantMealInterface {
  final MenuRepositoryInterface repository;

  GetRestaurantMealImpl({required this.repository});

  @override
  Future<Either<Failure, List<Product>>> call(RestaurantEnum restaurantInfo) {
    if (restaurantInfo == RestaurantEnum.biba) {
      return getBibaMeals();
    } else if (restaurantInfo == RestaurantEnum.hora_h) {
      return getHMeals();
    } else {
      return getMolezaMeals();
    }
  }

  Future<Either<Failure, List<Product>>> getBibaMeals() async {
    var result = await repository.getBibaMeals();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(message: S.current.errorEmptyList),
      );
    });
  }

  Future<Either<Failure, List<Product>>> getHMeals() async {
    var result = await repository.getHMeals();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(message: S.current.errorEmptyList),
      );
    });
  }

  Future<Either<Failure, List<Product>>> getMolezaMeals() async {
    var result = await repository.getMolezaMeals();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(message: S.current.errorEmptyList),
      );
    });
  }
}
