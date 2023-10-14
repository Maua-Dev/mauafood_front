import 'package:flutter/material.dart';
import 'package:mauafood_front/app/modules/user/presenter/ui/widgets/product_card_cart_widget.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_text_styles.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage(
      {super.key,
      required this.product,
      required this.productPrice,
      required this.productPhoto});

  OrderProductModel product;
  double productPrice;
  String productPhoto;
  String restaurantName = 'Nome do Restaurante';

  bool first = false;

  @override
  Widget build(BuildContext context) {
    if (product == null) {
      product = OrderProductModel.newInstance();
      productPrice = 0;
    }

    return SafeArea(
      child: Scaffold(
          body: first == true
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image.network(
                        greyLogo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      'Seu carrinho está vazio!',
                      style: AppTextStyles.h2,
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 80.0),
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
                              offset: const Offset(
                                  0, -3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Text(
                                restaurantName,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, bottom: 8),
                              child: SizedBox(
                                height: ScreenHelper.height(context) * 0.53,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return ProductCardCartWidget(
                                      product: product,
                                      productPhoto: productPhoto,
                                      productPrice:
                                          productPrice * product.quantity,
                                      onAdd: null,
                                      onSubtract: null,
                                    );
                                  },
                                  itemCount: 3,
                                ),
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
                                  Text(
                                      S.of(context).productPriceCurrency(
                                          productPrice * product.quantity * 3),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainBlueColor)),
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
