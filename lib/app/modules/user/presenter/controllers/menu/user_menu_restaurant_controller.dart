import 'package:flutter/material.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/user_menu_state.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/add_favorite_product.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/get_favorites.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/remove_favorite_product.dart';
import 'package:mauafood_front/app/modules/user/presenter/models/product_viewmodel.dart';
import 'package:mauafood_front/app/shared/helpers/services/snackbar/global_snackbar.dart';
import 'package:mauafood_front/app/shared/helpers/utils/string_helper.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/domain/enums/product_enum.dart';
import '../../../../../shared/domain/enums/restaurant_enum.dart';

import '../../../../../shared/domain/usecases/get_restaurant_product_usecase.dart';

part 'user_menu_restaurant_controller.g.dart';

class UserMenuRestaurantController = MenuRestaurantControllerBase
    with _$UserMenuRestaurantController;

abstract class MenuRestaurantControllerBase with Store {
  final IGetRestaurantProductUsecase _getRestaurantProduct;
  final AddFavoriteProduct _addFavoriteProduct;
  final RemoveFavoriteProduct _removeFavoriteProduct;
  final GetFavorites _getFavorites;
  RestaurantEnum restaurantInfo;

  MenuRestaurantControllerBase(
      this._getRestaurantProduct,
      this.restaurantInfo,
      this._addFavoriteProduct,
      this._removeFavoriteProduct,
      this._getFavorites) {
    loadFavorites().then((value) => loadRestaurantMenu());
  }

  @observable
  UserMenuState state = UserMenuInitialState();

  @observable
  List<ProductViewModel> listAllProduct = [];

  @observable
  bool isMaxPriceSearch = false;

  @observable
  bool isMinPriceSearch = false;

  @observable
  RangeValues? rangeValues;

  @observable
  String search = '';

  @observable
  int index = 0;

  @observable
  ProductEnum productType = ProductEnum.ALL;

  @action
  void setIsMaxPriceSearch(bool value) => isMaxPriceSearch = value;

  @action
  void setIsMinPriceSearch(bool value) => isMinPriceSearch = value;

  @action
  void setRangeValues(RangeValues value) => rangeValues = value;

  @action
  void setIndex(int value) => index = value;

  @action
  void setProductType(ProductEnum value) => productType = value;

  @action
  void changeState(UserMenuState value) => state = value;

  @action
  Future<void> loadRestaurantMenu() async {
    changeState(UserMenuLoadingState());
    var result = await _getRestaurantProduct(restaurantInfo);
    changeState(result.fold((l) => UserMenuErrorState(failure: l), (list) {
      listAllProduct = ProductViewModel.fromListProductWithFavorite(
          list, _productsFavorites);
      listAllProduct.sort(
        (a, b) {
          return a.type.index.compareTo(b.type.index);
        },
      );

      rangeValues = RangeValues(0,
          listAllProduct.map((e) => e.price).reduce((a, b) => a > b ? a : b));
      return UserMenuLoadedSuccessState(listProduct: listAllProduct, index: 0);
    }));
  }

  @action
  void filterProduct() {
    var filterList = listAllProduct;
    if (state is UserMenuLoadedSuccessState) {
      if (search != '') {
        filterList = filterList
            .where(
              (e) => e.name.withoutDiacritics
                  .toLowerCase()
                  .startsWith(search.toLowerCase().withoutDiacritics),
            )
            .toList();
      }
      if (productType != ProductEnum.ALL) {
        filterList = filterList
            .where(
              (e) => e.type == productType,
            )
            .toList();
      }
      if (isMaxPriceSearch) {
        filterList.sort((a, b) => b.price.compareTo(a.price));
      }
      if (isMinPriceSearch) {
        filterList.sort((a, b) => a.price.compareTo(b.price));
      }
      if (isMinPriceSearch == false && isMaxPriceSearch == false) {
        filterList.sort(
          (a, b) {
            return a.type.index.compareTo(b.type.index);
          },
        );
      }
      filterList = filterList
          .where((e) => e.price >= rangeValues!.start)
          .where((e) => e.price <= rangeValues!.end)
          .toList();
      changeState(
          UserMenuLoadedSuccessState(listProduct: filterList, index: index));
    }
  }

  @action
  void cleanFilter() {
    isMaxPriceSearch = false;
    isMinPriceSearch = false;
    rangeValues = RangeValues(
        0, listAllProduct.map((e) => e.price).reduce((a, b) => a > b ? a : b));
    search = '';
    productType = ProductEnum.ALL;
    index = 0;
    filterProduct();
  }

  List<String> _productsFavorites = [];
  Future<void> loadFavorites() async {
    final result = await _getFavorites();
    result.fold((l) => null, (r) {
      _productsFavorites = r;
    });
  }

  @action
  Future<bool> setFavoriteProduct(ProductViewModel product) async {
    if (product.isFavorite) {
      final result = await _removeFavoriteProduct(product.id!);
      result.fold((l) {
        GlobalSnackBar.error('Erro ao remover ${product.name} aos favoritos');
      }, (r) {
        _productsFavorites.remove(product.id);
        GlobalSnackBar.success('${product.name} removido dos favoritos');
      });
    } else {
      final result = await _addFavoriteProduct(product.id!);
      result.fold((l) {
        GlobalSnackBar.error('Erro ao adicionar ${product.name} aos favoritos');
      }, (r) {
        _productsFavorites.add(product.id!);
        GlobalSnackBar.success('${product.name} adicionado aos favoritos');
      });
    }
    listAllProduct = ProductViewModel.fromListProductWithFavorite(
        listAllProduct, _productsFavorites);
    changeState(
        UserMenuLoadedSuccessState(listProduct: listAllProduct, index: 0));
    return !product.isFavorite;
  }
}
