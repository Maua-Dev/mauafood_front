import 'package:mauafood_front/app/modules/profile/domain/repositories/favorites_repositorie_interface.dart';

abstract class RemoveFavoriteUsecase {
  Future<void> call(id);
}

class RemoveFavoriteUsecaseImpl implements RemoveFavoriteUsecase {
  final FavoritesRepository repository;

  RemoveFavoriteUsecaseImpl({required this.repository});

  @override
  Future<void> call(id) async {
    repository.removeFavorite(id);
  }
}
