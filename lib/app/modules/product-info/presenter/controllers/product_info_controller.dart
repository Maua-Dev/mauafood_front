import 'package:mobx/mobx.dart';

import '../../../../shared/domain/entities/product.dart';
import '../../../../shared/infra/models/order_model.dart';

part 'product_info_controller.g.dart';

class ProductInfoController = ProductInfoControllerBase
    with _$ProductInfoController;

abstract class ProductInfoControllerBase with Store {
  @observable
  var productCount = 1;

  @observable
  String observation = '';

  var product = OrderProductModel.newInstance();

  @action
  void increaseProductCount() {
    productCount = productCount + 1;
    product = product.copyWith(quantity: productCount);
  }

  @action
  void decreaseProductCount() {
    if (productCount > 1) {
      productCount = productCount - 1;
      product = product.copyWith(quantity: productCount);
    }
  }

  @action
  void setProductObservation(String text) {
    product = product.copyWith(observation: text);
  }

  @action
  void setProduct(Product pageProduct) {
    product = product.copyWith(
      name: pageProduct.name,
      id: pageProduct.id,
    );
  }
}
