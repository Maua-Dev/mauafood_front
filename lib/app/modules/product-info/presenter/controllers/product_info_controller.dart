import 'package:mobx/mobx.dart';
import '../../../../shared/infra/models/cart_product_model.dart';
import '../../../user/presenter/models/product_viewmodel.dart';

part 'product_info_controller.g.dart';

class ProductInfoController = ProductInfoControllerBase
    with _$ProductInfoController;

abstract class ProductInfoControllerBase with Store {
  ProductInfoControllerBase({required this.product}) {
    setProduct();
  }

  @observable
  var productCart = CartProductModel.newInstance();

  final ProductViewModel product;

  @action
  void increaseProductCount() {
    productCart = productCart.copyWith(quantity: productCart.quantity + 1);
  }

  @action
  void decreaseProductCount() {
    if (productCart.quantity > 1) {
      productCart = productCart.copyWith(quantity: productCart.quantity - 1);
    }
  }

  @action
  void setProductObservation(String text) {
    productCart = productCart.copyWith(observation: text);
  }

  @action
  void setProduct() {
    productCart = productCart.copyWith(
      name: product.name,
      id: product.id,
      price: product.price,
      photo: product.photo,
    );
  }
}
