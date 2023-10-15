import 'package:mauafood_front/app/shared/infra/models/cart_product_model.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = CartControllerBase with _$CartController;

abstract class CartControllerBase with Store {
  @observable
  bool isNewProduct = true;

  @observable
  List<CartProductModel> cartList = [];

  @observable
  List<CartProductModel> priceList = [];

  @action
  void addProductToCart(CartProductModel? product) {
    if (product != null && isNewProduct) {
      cartList.add(product);
      isNewProduct = false;
    }
  }

  @action
  void addQuantitytoProduct(int index) {
    cartList[index].copyWith(quantity: cartList[index].quantity + 1);
  }

  @action
  void subtractQuantitytoProduct(int index) {
    if (cartList[index].quantity == 1) {
      cartList.removeAt(index);
    }
    cartList[index].copyWith(quantity: cartList[index].quantity - 1);

    print(cartList[index].quantity);
  }
}
