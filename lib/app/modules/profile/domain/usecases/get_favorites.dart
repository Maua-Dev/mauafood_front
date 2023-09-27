import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

import '../repositories/favorite_repository.dart';

abstract class GetFavorites {
  Future<Either<Failure, List<String>>> call();
}

class GetFavoritesImpl implements GetFavorites {
  final FavoriteRepository _repository;

  GetFavoritesImpl(this._repository);
  @override
  Future<Either<Failure, List<String>>> call() async {
    return await _repository.getFavorites();
  }
}
