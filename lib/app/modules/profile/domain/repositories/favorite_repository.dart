import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, Unit>> addFavorite(String id);
  Future<Either<Failure, Unit>> removeFavorite(String id);
  Future<Either<Failure, List<String>>> getFavorites();
}
