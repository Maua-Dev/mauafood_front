import 'package:mauafood_front/app/shared/infra/models/cart_product_model.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = CartControllerBase with _$CartController;

abstract class CartControllerBase with Store {
  @observable
  List<CartProductModel> cartList = ObservableList<CartProductModel>();

  @observable
  double totalPrice = 0;

  @observable
  String restaurantName = "";

  @action
  void setRestaurantName(name, product) {
    if (restaurantName == name) {
      addProductToCart(product);
    } else if (restaurantName.isEmpty) {
      restaurantName = name;
      addProductToCart(product);
    }
  }

  @action
  void calculateTotalPrice() {
    totalPrice = 0;
    for (CartProductModel product in cartList) {
      totalPrice = totalPrice + product.price * product.quantity;
    }
  }

  @action
  void addProductToCart(CartProductModel? product) {
    if (product != null) {
      cartList.add(product);
      calculateTotalPrice();
    }
  }

  @action
  void addQuantitytoProduct(int index) {
    var auxiliar = cartList[index];
    auxiliar = auxiliar.copyWith(quantity: (auxiliar.quantity + 1));
    cartList[index] = auxiliar;
    calculateTotalPrice();
  }

  @action
  void subtractQuantitytoProduct(int index) {
    if (cartList[index].quantity <= 1) {
      cartList.removeAt(index);
      calculateTotalPrice();
      if (cartList.isEmpty) {
        restaurantName = "";
      }
    } else {
      var auxiliar = cartList[index];
      auxiliar = auxiliar.copyWith(quantity: (auxiliar.quantity - 1));
      cartList[index] = auxiliar;
      calculateTotalPrice();
    }
  }
}
