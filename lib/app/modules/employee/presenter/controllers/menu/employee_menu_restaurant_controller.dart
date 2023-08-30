import 'package:auth_package/core/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/product-card/product_card_employee_state.dart';

import 'package:mauafood_front/app/shared/helpers/utils/string_helper.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/domain/enums/product_enum.dart';
import '../../../../../shared/domain/enums/restaurant_enum.dart';
import '../../../../../shared/domain/usecases/get_restaurant_product_usecase.dart';
import '../../../usecases/delete_product_usecase.dart';
import '../../states/employee_menu_state.dart';

part 'employee_menu_restaurant_controller.g.dart';

class EmployeeMenuRestaurantController = MenuRestaurantControllerBase
    with _$EmployeeMenuRestaurantController;

abstract class MenuRestaurantControllerBase with Store {
  final IGetRestaurantProductUsecase _getRestaurantProduct;
  final IDeleteProductUsecase _deleteProduct;
  final AuthStore _authStore;
  RestaurantEnum restaurantInfo;

  MenuRestaurantControllerBase(this._getRestaurantProduct, this.restaurantInfo,
      this._deleteProduct, this._authStore) {
    loadRestaurantMenu().then((value) {
      filterProduct();
    });
  }

  void logout() async {
    await _authStore.signOut();
    Modular.to.navigate('/login/');
  }

  @observable
  EmployeeMenuState state = EmployeeMenuInitialState();

  @observable
  ProductCardEmployeeState productCardState = ProductCardEmployeeInitialState();

  @observable
  List<ProductModel> listAllProduct = ObservableList();

  @observable
  List<ProductModel> listAllProductWithoutAccent = ObservableList();

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
  void changeState(EmployeeMenuState value) => state = value;

  @action
  void changeProductCardState(ProductCardEmployeeState value) =>
      productCardState = value;

  @action
  Future<void> loadRestaurantMenu() async {
    changeState(EmployeeMenuLoadingState());
    var result = await _getRestaurantProduct(restaurantInfo);
    changeState(result.fold((l) => EmployeeMenuErrorState(failure: l), (list) {
      listAllProduct = list;
      rangeValues = RangeValues(0,
          listAllProduct.map((e) => e.price).reduce((a, b) => a > b ? a : b));
      return EmployeeMenuLoadedSuccessState(listProduct: list, index: 0);
    }));
  }

  @action
  void filterProduct() {
    var filterList = listAllProduct;
    if (state is EmployeeMenuLoadedSuccessState) {
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
        filterList.sort((a, b) {
          final typeComparison = a.type.index.compareTo(b.type.index);
          if (typeComparison != 0) {
            return typeComparison; // Ordena por tipo
          } else {
            return a.name
                .compareTo(b.name); // Dentro do mesmo tipo, ordena por nome
          }
        });
      }
      filterList = filterList
          .where((e) => e.price >= rangeValues!.start)
          .where((e) => e.price <= rangeValues!.end)
          .toList();
      changeState(EmployeeMenuLoadedSuccessState(
          listProduct: filterList, index: index));
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

  @action
  Future<void> deleteProduct(
      RestaurantEnum restaurant, String id, int index) async {
    changeProductCardState(ProductCardEmployeeLoadingState(index: index));
    var result = await _deleteProduct(id, restaurant);
    changeProductCardState(
        result.fold((l) => ProductCardEmployeeFailureState(failure: l), (r) {
      listAllProductWithoutAccent.removeWhere((element) => element.id == id);
      listAllProduct.removeWhere((element) => element.id == id);
      filterProduct();
      return ProductCardEmployeeSuccessState();
    }));
  }
}
