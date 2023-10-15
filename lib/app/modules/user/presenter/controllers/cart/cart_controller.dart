import 'package:mauafood_front/app/shared/infra/models/cart_product_model.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = CartControllerBase with _$CartController;

abstract class CartControllerBase with Store {
  @observable
  List<CartProductModel> cartList = [];

  @observable
  List<CartProductModel> priceList = [];

  @action
  void addProductToCart(
      CartProductModel product, String productPhoto, double productPrice) {}
}
