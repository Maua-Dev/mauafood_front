import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/profile/domain/repositories/favorite_repository.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class AddFavoriteProduct {
  Future<Either<Failure, Unit>> call(String productId);
}

class AddFavoriteProductImpl implements AddFavoriteProduct {
  final FavoriteRepository _repository;

  AddFavoriteProductImpl(this._repository);
  @override
  Future<Either<Failure, Unit>> call(String productId) async {
    return await _repository.addFavorite(productId);
  }
}
