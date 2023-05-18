import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/product.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../errors/errors.dart';
import '../infra/menu_repository_interface.dart';

abstract class IGetRestaurantProductUsecase {
  Future<Either<Failure, List<Product>>> call(RestaurantEnum restaurantInfo);
}

class GetRestaurantProductUsecase implements IGetRestaurantProductUsecase {
  final MenuRepositoryInterface repository;

  GetRestaurantProductUsecase({required this.repository});

  @override
  Future<Either<Failure, List<Product>>> call(RestaurantEnum restaurantInfo) {
    if (restaurantInfo == RestaurantEnum.biba) {
      return getBibaProducts();
    } else if (restaurantInfo == RestaurantEnum.hora_h) {
      return getHProducts();
    } else {
      return getMolezaProducts();
    }
  }

  Future<Either<Failure, List<Product>>> getBibaProducts() async {
    var result = await repository.getBibaProducts();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(message: S.current.errorEmptyList),
      );
    });
  }

  Future<Either<Failure, List<Product>>> getHProducts() async {
    var result = await repository.getHoraHProducts();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(message: S.current.errorEmptyList),
      );
    });
  }

  Future<Either<Failure, List<Product>>> getMolezaProducts() async {
    var result = await repository.getMolezaProducts();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(message: S.current.errorEmptyList),
      );
    });
  }
}
