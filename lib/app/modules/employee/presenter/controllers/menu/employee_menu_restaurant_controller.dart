import 'package:mauafood_front/app/modules/employee/presenter/states/product-card/product_card_employee_state.dart';
import 'package:mauafood_front/app/shared/domain/usecases/delete_product_usecase.dart';
import 'package:mauafood_front/app/shared/helpers/utils/string_helper.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/domain/enums/product_enum.dart';
import '../../../../../shared/domain/enums/restaurant_enum.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/usecases/get_restaurant_product_usecase.dart';
import '../../states/employee_menu_state.dart';

part 'employee_menu_restaurant_controller.g.dart';

class EmployeeMenuRestaurantController = MenuRestaurantControllerBase
    with _$EmployeeMenuRestaurantController;

abstract class MenuRestaurantControllerBase with Store {
  final IGetRestaurantProductUsecase _getRestaurantProduct;
  final IDeleteProductUsecase _deleteProduct;
  RestaurantEnum restaurantInfo;

  MenuRestaurantControllerBase(
      this._getRestaurantProduct, this.restaurantInfo, this._deleteProduct) {
    loadRestaurantMenu();
  }

  @observable
  EmployeeMenuState state = EmployeeMenuInitialState();

  @observable
  ProductCardEmployeeState productCardState = ProductCardEmployeeInitialState();

  @observable
  List<Product> listAllProduct = [];

  @observable
  List<Product> listAllProductWithoutAccent = [];

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
      return EmployeeMenuLoadedSuccessState(listProduct: list, index: 0);
    }));
  }

  @action
  Future<void> searchProduct(String search) async {
    if (state is EmployeeMenuLoadedSuccessState) {
      if (search == '') {
        changeState(EmployeeMenuLoadedSuccessState(
            listProduct: listAllProduct, index: 0));
      } else {
        var filterList = listAllProduct
            .where(
              (e) => e.name.withoutDiacritics
                  .toLowerCase()
                  .startsWith(search.toLowerCase().withoutDiacritics),
            )
            .toList();
        changeState(
            EmployeeMenuLoadedSuccessState(listProduct: filterList, index: 0));
      }
    }
  }

  @action
  Future<void> filterProduct(ProductEnum productType) async {
    if (state is EmployeeMenuLoadedSuccessState) {
      if (productType == ProductEnum.ALL) {
        changeState(EmployeeMenuLoadedSuccessState(
            listProduct: listAllProduct, index: 0));
      } else {
        var filterList = listAllProduct
            .where(
              (e) => e.type == productType,
            )
            .toList();
        changeState(EmployeeMenuLoadedSuccessState(
            listProduct: filterList, index: productType.index));
      }
    }
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
      return ProductCardEmployeeSuccessState();
    }));
  }
}
