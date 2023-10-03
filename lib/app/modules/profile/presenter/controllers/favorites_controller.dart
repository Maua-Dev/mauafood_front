import 'package:mauafood_front/app/modules/profile/domain/usecases/get_favorites_product.dart';
import 'package:mauafood_front/app/modules/profile/presenter/states/favorite_state.dart';
import 'package:mauafood_front/app/modules/profile/presenter/ui/models/favorite_viewmodel.dart';

import 'package:mobx/mobx.dart';
part 'favorites_controller.g.dart';

class FavoritesController = FavoritesControllerBase with _$FavoritesController;

abstract class FavoritesControllerBase with Store {
  final GetFavoritesProduct _getFavoritesProduct;

  FavoritesControllerBase(this._getFavoritesProduct) {
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
  Future<bool> removeFavorite(String id) async {
    productsFavorites.removeWhere((element) => element.id == id);
    setState(SuccessFavoriteState(productsFavorites));
    return true;
  }
}
