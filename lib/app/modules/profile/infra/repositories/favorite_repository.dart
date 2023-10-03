import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/profile/infra/datasource/favorite_datasource.dart';

import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

import '../../domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDatasource _datasource;

  FavoriteRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Unit>> addFavorite(String id) async {
    try {
      await _datasource.addFavorite(id);
      return const Right(unit);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<String>>> getFavorites() async {
    try {
      final list = await _datasource.getFavorites();
      return Right(list);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite(String id) async {
    try {
      await _datasource.removeFavorite(id);
      return const Right(unit);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
