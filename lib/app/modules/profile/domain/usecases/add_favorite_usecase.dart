import 'package:mauafood_front/app/modules/profile/domain/repositories/favorites_repositorie_interface.dart';

abstract class AddFavoriteUsecase {
  Future<void> call(id);
}

class AddFavoriteUsecaseImpl implements AddFavoriteUsecase {
  final FavoritesRepository repository;

  AddFavoriteUsecaseImpl({required this.repository});

  @override
  Future<void> call(id) async {
    repository.addFavorite(id);
  }
}
