import 'package:mobx/mobx.dart';
import '../../../../shared/domain/entities/product.dart';
import '../../../../shared/infra/models/cart_product_model.dart';

part 'product_info_controller.g.dart';

class ProductInfoController = ProductInfoControllerBase
    with _$ProductInfoController;

abstract class ProductInfoControllerBase with Store {
  @observable
  var product = CartProductModel.newInstance();

  @action
  void increaseProductCount() {
    product = product.copyWith(quantity: product.quantity + 1);
  }

  @action
  void decreaseProductCount() {
    if (product.quantity > 1) {
      product = product.copyWith(quantity: product.quantity - 1);
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
      price: pageProduct.price,
      photo: pageProduct.photo,
    );
  }
}
