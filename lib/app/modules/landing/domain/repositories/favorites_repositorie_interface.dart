import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';

import '../../../../shared/helpers/errors/errors.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<Product>>> getFavorites();
  Future<Either<Failure, String>> removeFavorite(String id);
  Future<Either<Failure, String>> addFavorite(String id);
}
