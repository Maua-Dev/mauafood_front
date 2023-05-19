import 'package:mauafood_front/app/modules/menu/presenter/states/menu_state.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/domain/enums/product_enum.dart';
import '../../../../restaurants/domain/infra/restaurant_enum.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/usecases/get_restaurant_product_usecase.dart';

part 'menu_controller.g.dart';

class MenuController = MenuControllerBase with _$MenuController;

abstract class MenuControllerBase with Store {
  final IGetRestaurantProductUsecase _getRestaurantProduct;
  RestaurantEnum restaurantInfo;

  MenuControllerBase(this._getRestaurantProduct, this.restaurantInfo) {
    loadRestaurantMenu();
  }

  @observable
  MenuState state = MenuInitialState();

  @observable
  List<Product> listAllProduct = [];

  @action
  void changeState(MenuState value) => state = value;

  @action
  Future<void> loadRestaurantMenu() async {
    changeState(MenuLoadingState());
    var result = await _getRestaurantProduct(restaurantInfo);
    changeState(result.fold((l) => MenuErrorState(failure: l), (list) {
      listAllProduct = list;
      return MenuLoadedSuccessState(listProduct: list, index: 0);
    }));
  }

  @action
  Future<void> searchProduct(String search) async {
    if (state is MenuLoadedSuccessState) {
      if (search == '') {
        changeState(
            MenuLoadedSuccessState(listProduct: listAllProduct, index: 0));
      } else {
        var list = (state as MenuLoadedSuccessState).listProduct;
        var filterList = list
            .where(
              (e) => e.name.toLowerCase().startsWith(search.toLowerCase()),
            )
            .toList();
        changeState(MenuLoadedSuccessState(listProduct: filterList, index: 0));
      }
    }
  }

  @action
  Future<void> filterProduct(ProductEnum productType) async {
    if (state is MenuLoadedSuccessState) {
      if (productType == ProductEnum.ALL) {
        changeState(
            MenuLoadedSuccessState(listProduct: listAllProduct, index: 0));
      } else {
        var list = (state as MenuLoadedSuccessState).listProduct;
        var filterList = list
            .where(
              (e) => e.type == productType,
            )
            .toList();
        changeState(MenuLoadedSuccessState(
            listProduct: filterList, index: productType.index));
      }
    }
  }
}
