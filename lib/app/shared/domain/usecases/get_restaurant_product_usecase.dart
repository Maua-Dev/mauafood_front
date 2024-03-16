import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import '../../helpers/errors/errors.dart';
import '../repositories/menu_repository_interface.dart';

abstract class IGetRestaurantProductUsecase {
  Future<Either<Failure, List<ProductModel>>> call(RestaurantEnum restaurantInfo);
}

class GetRestaurantProductUsecase implements IGetRestaurantProductUsecase {
  final IMenuRepository repository;

  GetRestaurantProductUsecase({required this.repository});

  @override
  Future<Either<Failure, List<ProductModel>>> call(RestaurantEnum restaurantInfo) {
    if (restaurantInfo == RestaurantEnum.souza_de_abreu) {
      return getBibaProducts();
    } else if (restaurantInfo == RestaurantEnum.hora_h) {
      return getHProducts();
    } else {
      return getMolezaProducts();
    }
  }

  Future<Either<Failure, List<ProductModel>>> getBibaProducts() async {
    var result = await repository.getBibaProducts();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(),
      );
    });
  }

  Future<Either<Failure, List<ProductModel>>> getHProducts() async {
    var result = await repository.getHoraHProducts();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(),
      );
    });
  }

  Future<Either<Failure, List<ProductModel>>> getMolezaProducts() async {
    var result = await repository.getMolezaProducts();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(),
      );
    });
  }
}
