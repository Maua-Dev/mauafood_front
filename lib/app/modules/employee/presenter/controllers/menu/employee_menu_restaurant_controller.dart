import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
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
  RestaurantEnum restaurantInfo = RestaurantEnum.biba;

  MenuRestaurantControllerBase(
      this._getRestaurantProduct, this.restaurantInfo) {
    //loadRestaurantMenu();
  }

  @observable
  EmployeeMenuState state =
      EmployeeMenuErrorState(failure: Failure(message: 'message'));

  @observable
  List<Product> listAllProduct = [];

  @observable
  List<Product> listAllProductWithoutAccent = [];

  @action
  void changeState(EmployeeMenuState value) => state = value;

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
}
