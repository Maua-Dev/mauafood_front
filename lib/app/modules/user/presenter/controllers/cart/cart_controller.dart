import 'package:flutter/material.dart';
import 'package:mauafood_front/app/modules/user/domain/usecases/create_order_usecase.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/cart/states/cart_states.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/infra/models/cart_product_model.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = CartControllerBase with _$CartController;

abstract class CartControllerBase with Store {
  @observable
  List<CartProductModel> cartList = ObservableList<CartProductModel>();

  final ICreateOrderUsecase _createOrder;

  @observable
  double totalPrice = 0;

  @observable
  RestaurantEnum restaurantCart = RestaurantEnum.none;

  @observable
  CartState state = CartInitialState();

  @action
  void changeState(CartState value) => state = value;

  CartControllerBase(this._createOrder);

  @action
  Future<void> createOrder(BuildContext context) async {
    var result = await _createOrder(cartList, restaurantCart);

    changeState(result.fold((l) => CartErrorState(failure: l), (order) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.white,
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 200,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: Text(
                        "Seu pedido foi enviado ao restaurante!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
      return CartLoadedSuccessState(order: order, productList: cartList);
    }));
    cartList = [];
    restaurantCart = RestaurantEnum.none;
  }

  @action
  bool setRestaurantName(
      RestaurantEnum restaurant, product, BuildContext context) {
    if (restaurantCart == restaurant) {
      addProductToCart(product);
      return true;
    } else if (restaurantCart == RestaurantEnum.none) {
      restaurantCart = restaurant;
      addProductToCart(product);
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 800),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.mainBlueColor,
      content: Text(
          "Não é possivel adicionar produtos de restaurantes diferentes",
          style: AppTextStyles.h2.copyWith(color: AppColors.white)),
    ));
    return false;
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
        restaurantCart = RestaurantEnum.none;
      }
    } else {
      var auxiliar = cartList[index];
      auxiliar = auxiliar.copyWith(quantity: (auxiliar.quantity - 1));
      cartList[index] = auxiliar;
      calculateTotalPrice();
    }
  }
}
