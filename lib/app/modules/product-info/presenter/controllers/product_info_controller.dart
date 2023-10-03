import 'package:mobx/mobx.dart';

part 'product_info_controller.g.dart';

class ProductInfoController = ProductInfoControllerBase
    with _$ProductInfoController;

abstract class ProductInfoControllerBase with Store {
  @observable
  var productCount = 1;

  @action
  void increaseProductCount() {
    productCount = productCount + 1;
  }

  @action
  void decreaseProductCount() {
    if (productCount > 1) {
      productCount = productCount - 1;
    }
  }
}
