import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import '../../helpers/errors/errors.dart';
import '../repositories/menu_repository_interface.dart';

abstract class IGetRestaurantProductUsecase {
  Future<Either<Failure, List<Product>>> call(RestaurantEnum restaurantInfo);
}

class GetRestaurantProductUsecase implements IGetRestaurantProductUsecase {
  final IMenuRepository repository;

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
        () => EmptyList(),
      );
    });
  }

  Future<Either<Failure, List<Product>>> getHProducts() async {
    var result = await repository.getHoraHProducts();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(),
      );
    });
  }

  Future<Either<Failure, List<Product>>> getMolezaProducts() async {
    var result = await repository.getMolezaProducts();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(),
      );
    });
  }
}
