import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/profile/domain/repositories/favorite_repository.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class RemoveFavoriteProduct {
  Future<Either<Failure, Unit>> call(String productId);
}

class RemoveFavoriteProductImpl implements RemoveFavoriteProduct {
  final FavoriteRepository _repository;

  RemoveFavoriteProductImpl(this._repository);
  @override
  Future<Either<Failure, Unit>> call(String productId) async {
    return await _repository.removeFavorite(productId);
  }
}
