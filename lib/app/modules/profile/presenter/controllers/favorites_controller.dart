import 'package:mauafood_front/app/modules/profile/domain/usecases/get_favorites_product.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/remove_favorite_product.dart';
import 'package:mauafood_front/app/modules/profile/presenter/states/favorite_state.dart';
import 'package:mauafood_front/app/modules/profile/presenter/ui/models/favorite_viewmodel.dart';
import 'package:mauafood_front/app/shared/helpers/services/snackbar/global_snackbar.dart';

import 'package:mobx/mobx.dart';
part 'favorites_controller.g.dart';

class FavoritesController = FavoritesControllerBase with _$FavoritesController;

abstract class FavoritesControllerBase with Store {
  final GetFavoritesProduct _getFavoritesProduct;
  final RemoveFavoriteProduct _removeFavoriteProduct;
  FavoritesControllerBase(
      this._getFavoritesProduct, this._removeFavoriteProduct) {
    loadFavorites();
  }
  @observable
  FavoriteState state = const LoadingFavoriteState();
  @action
  void setState(FavoriteState value) => state = value;
  @observable
  List<FavoriteViewModel> productsFavorites = [];

  Future<void> loadFavorites() async {
    final result = await _getFavoritesProduct();
    result.fold((l) => setState(ErrorFavoriteState(l.message)), (r) {
      productsFavorites = r;
      setState(SuccessFavoriteState(r));
    });
  }

  @action
  Future<bool> removeFavorite(FavoriteViewModel item) async {
    final result = await _removeFavoriteProduct(item.id!);
    result.fold((l) {
      GlobalSnackBar.error('Erro ao remover ${item.name} aos favoritos');
    }, (r) {
      productsFavorites.removeWhere((element) => element.id == item.id);
      setState(SuccessFavoriteState(productsFavorites));
      GlobalSnackBar.success('${item.name} removido dos favoritos');
    });

    return true;
  }
}
