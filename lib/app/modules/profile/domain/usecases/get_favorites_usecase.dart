import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/profile/domain/repositories/favorites_repositorie_interface.dart';

import '../../../../shared/domain/entities/product.dart';
import '../../../../shared/helpers/errors/errors.dart';

abstract class GetFavoritesUsecase {
  Future<Either<Failure, List<Product>>> call();
}

class GetFavoritesUsecaseImpl implements GetFavoritesUsecase {
  final FavoritesRepository repository;

  GetFavoritesUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, List<Product>>> call() async {
    var result = await repository.getFavorites();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where((r) => r.isNotEmpty, () => EmptyList());
    });
  }
}
