import 'package:flutter/material.dart';
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
  RestaurantEnum restaurantInfo;

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
      listAllProduct = list;
      listAllProduct.sort(
        (a, b) {
          return a.type.index.compareTo(b.type.index);
        },
      );
      rangeValues = RangeValues(0,
          listAllProduct.map((e) => e.price).reduce((a, b) => a > b ? a : b));
      return UserMenuLoadedSuccessState(listProduct: list, index: 0);
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
}
