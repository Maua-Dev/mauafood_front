import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/landing/presenter/controllers/landing_controller.dart';
import 'package:mauafood_front/app/modules/user/presenter/ui/widgets/product_card_cart_widget.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../controllers/cart/cart_controller.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController controller = Modular.get();

  final LandingController controllerNavBar = Modular.get();

  bool first = false;

  @override
  Widget build(BuildContext context) {
    controllerNavBar.selectIndex(1);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text(
                S.of(context).cart,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            leading: BackButton(
              color: AppColors.mainBlueColor,
              onPressed: () {
                controllerNavBar.selectIndex(0);
                Modular.to.navigate('/landing/restaurants/');
              },
            ),
          ),
          body: controller.cartList.isEmpty
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Image.network(
                          greyLogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      'Seu carrinho está vazio!',
                      style: AppTextStyles.h2,
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(64)),
                          color: AppColors.backgroundColor2,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, -3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 80.0),
                                child: Text(
                                  controller.restaurantName,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 8, left: 16, right: 16),
                              child: SizedBox(
                                height: ScreenHelper.height(context) * 0.5,
                                child: Observer(builder: (_) {
                                  return ListView.builder(
                                    itemBuilder: (context, index) {
                                      return ProductCardCartWidget(
                                        product: controller.cartList[index],
                                        onAdd: () => controller
                                            .addQuantitytoProduct(index),
                                        onSubtract: () => {
                                          controller
                                              .subtractQuantitytoProduct(index),
                                          setState(() {}),
                                        },
                                      );
                                    },
                                    itemCount: controller.cartList.length,
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.black,
                        thickness: 2,
                      ),
                      Container(
                        height: ScreenHelper.width(context) * 0.25,
                        width: ScreenHelper.width(context),
                        color: AppColors.backgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.mainBlueColor, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Confirmar Pedido",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.mainBlueColor),
                                  ),
                                  Observer(builder: (_) {
                                    return Text(
                                        S.of(context).productPriceCurrency(
                                            controller.totalPrice),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.mainBlueColor));
                                  }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
