import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/profile/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/profile/presenter/ui/models/favorite_viewmodel.dart';

import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

import 'package:mauafood_front/app/shared/infra/repositories/menu_repository.dart';

import '../repositories/favorite_repository.dart';

abstract class GetFavoritesProduct {
  Future<Either<Failure, List<FavoriteViewModel>>> call();
}

class GetFavoritesProductImpl implements GetFavoritesProduct {
  final FavoriteRepository _repository;
  final MenuRepository _menuRepository;
  GetFavoritesProductImpl(this._repository, this._menuRepository);
  @override
  Future<Either<Failure, List<FavoriteViewModel>>> call() async {
    final listFavoritesSaved = await _repository.getFavorites();

    return listFavoritesSaved.fold((l) {
      return Left(GetFavoritesError(message: 'Error to get favorites'));
    }, (r) async {
      final allProducts = await _menuRepository.getAllProducts();

      return allProducts.fold((l) => Left(l), (res) {
        final souzaAbreu =
            FavoriteViewModel.fromMaps(res['SOUZA_DE_ABREU'], 'Souza de Abreu');
        final hora = FavoriteViewModel.fromMaps(res['HORA_H'], 'Hora H');
        final moleza = FavoriteViewModel.fromMaps(
            res['CANTINA_DO_MOLEZA'], 'Cantina do Moleza');
        final list = [...souzaAbreu, ...hora, ...moleza];
        final favorites =
            list.where((element) => r.contains(element.id)).toList();
        return Right(favorites);
      });
    });
  }
}
