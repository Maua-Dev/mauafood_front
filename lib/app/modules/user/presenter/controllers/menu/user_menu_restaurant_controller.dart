import 'package:mauafood_front/app/modules/employee/presenter/states/user_menu_state.dart';
import 'package:mauafood_front/app/shared/helpers/utils/string_helper.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/domain/enums/product_enum.dart';
import '../../../../../shared/domain/enums/restaurant_enum.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/usecases/get_restaurant_product_usecase.dart';

part 'user_menu_restaurant_controller.g.dart';

class UserMenuRestaurantController = MenuRestaurantControllerBase
    with _$UserMenuRestaurantController;

abstract class MenuRestaurantControllerBase with Store {
  final IGetRestaurantProductUsecase _getRestaurantProduct;
  RestaurantEnum restaurantInfo = RestaurantEnum.souza_de_abreu;

  MenuRestaurantControllerBase(
      this._getRestaurantProduct, this.restaurantInfo) {
    loadRestaurantMenu();
  }

  @observable
  UserMenuState state = UserMenuInitialState();

  @observable
  List<Product> listAllProduct = [];

  @observable
  List<Product> listAllProductWithoutAccent = [];

  @action
  void changeState(UserMenuState value) => state = value;

  @action
  Future<void> loadRestaurantMenu() async {
    changeState(UserMenuLoadingState());
    var result = await _getRestaurantProduct(restaurantInfo);
    changeState(result.fold((l) => UserMenuErrorState(failure: l), (list) {
      listAllProduct = list;
      return UserMenuLoadedSuccessState(listProduct: list, index: 0);
    }));
  }

  @action
  Future<void> searchProduct(String search) async {
    if (state is UserMenuLoadedSuccessState) {
      if (search == '') {
        changeState(
            UserMenuLoadedSuccessState(listProduct: listAllProduct, index: 0));
      } else {
        var filterList = listAllProduct
            .where(
              (e) => e.name.withoutDiacritics
                  .toLowerCase()
                  .startsWith(search.toLowerCase().withoutDiacritics),
            )
            .toList();
        changeState(
            UserMenuLoadedSuccessState(listProduct: filterList, index: 0));
      }
    }
  }

  @action
  Future<void> filterProduct(ProductEnum productType, int index) async {
    if (state is UserMenuLoadedSuccessState) {
      if (productType == ProductEnum.ALL) {
        changeState(
            UserMenuLoadedSuccessState(listProduct: listAllProduct, index: 0));
      } else {
        var filterList = listAllProduct
            .where(
              (e) => e.type == productType,
            )
            .toList();
        changeState(
            UserMenuLoadedSuccessState(listProduct: filterList, index: index));
      }
    }
  }
}
