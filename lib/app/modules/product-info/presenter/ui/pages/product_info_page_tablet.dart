import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/controllers/product_info_controller.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../../../../user/presenter/controllers/cart/cart_controller.dart';
import '../widgets/recommended_product_widget.dart';

class ProductInfoPageTablet extends StatefulWidget {
  final Product productInfo;
  final List<Product> recommendedProductList;
  const ProductInfoPageTablet({
    super.key,
    required this.productInfo,
    required this.recommendedProductList,
  });

  @override
  State<ProductInfoPageTablet> createState() => _ProductInfoPageTabletState();
}

class _ProductInfoPageTabletState extends State<ProductInfoPageTablet> {
  final ProductInfoController controller = Modular.get();
  final CartController controllerCart = Modular.get();
  late Product product;
  @override
  void initState() {
    super.initState();
    product = widget.productInfo;
  }

  @override
  Widget build(BuildContext context) {
    final recommendedProductListFilter = widget.recommendedProductList
        .where((element) => element.id != product.id)
        .toList();
    return Scaffold(
      backgroundColor: const Color(0xffFAF9F6),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAF9F6),
        elevation: 0,
        leading: BackButton(
          color: AppColors.mainBlueColor,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox.fromSize(
              size: Size.fromHeight(MediaQuery.of(context).size.height / 4),
              child: CachedNetworkImage(
                imageUrl: product.photo!,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 700,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: AppTextStyles.h1,
                              ),
                              Text(
                                S
                                    .of(context)
                                    .productPriceCurrency(product.price),
                                style: AppTextStyles.h1.copyWith(fontSize: 22),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                product.description ?? "",
                                style: AppTextStyles.h3
                                    .copyWith(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[350],
                        height: 64,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.message,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Alguma Observação",
                              style: TextStyle(
                                  color: AppColors.mainBlueColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: ScreenHelper.width(context) / 2.2,
                              child: TextField(
                                onChanged: controller.setProductObservation,
                                style: const TextStyle(height: 1, fontSize: 16),
                                maxLines: 6,
                                minLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  fillColor: Colors.white,
                                  hintText: "Ex: Tirar o alface",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.mainBlueColor),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.mainBlueColor),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 50,
                              width: ScreenHelper.width(context) / 2.8,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    border: Border.all(
                                        color: AppColors.mainBlueColor,
                                        width: 1)),
                                child: Row(
                                  children: [
                                    Observer(builder: (_) {
                                      return TextButton(
                                          onPressed: () =>
                                              controller.productCart.quantity !=
                                                      1
                                                  ? controller
                                                      .decreaseProductCount()
                                                  : null,
                                          child: Text(
                                            "-",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: controller.productCart
                                                            .quantity !=
                                                        1
                                                    ? AppColors.mainBlueColor
                                                    : Colors.grey,
                                                fontSize: 16),
                                          ));
                                    }),
                                    Observer(builder: (_) {
                                      return Text(
                                          controller.productCart.quantity
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.mainBlueColor,
                                              fontSize: 16));
                                    }),
                                    TextButton(
                                        onPressed: () =>
                                            controller.increaseProductCount(),
                                        child: Text("+",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.mainBlueColor,
                                                fontSize: 16))),
                                    const Flexible(child: SizedBox.expand()),
                                    GestureDetector(
                                      onTap: () => {
                                        controllerCart.setRestaurantName(
                                            controllerCart.restaurantCart,
                                            controller.productCart,
                                            context),
                                        Modular.to.navigate("/landing/cart/"),
                                      },
                                      child: SizedBox(
                                        child: Container(
                                          height: 60,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: AppColors.mainBlueColor,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: Border.all(
                                                color: AppColors.mainBlueColor,
                                                width: 1,
                                              )),
                                          child: Center(
                                              child: Text(
                                            "Adicionar ao Carrinho",
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[350],
                        height: 64,
                        thickness: 1,
                      ),
                      SizedBox(
                        width: ScreenHelper.width(context) * 0.9,
                        child: Text(
                          S.of(context).recommendedTitle,
                          style: AppTextStyles.h2
                              .copyWith(color: AppColors.mainBlueColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SafeArea(
                          child: SizedBox(
                        height: 160,
                        width: ScreenHelper.width(context),
                        child: ListView.separated(
                          itemBuilder: (context, index) => SizedBox(
                            height: 150,
                            width: MediaQuery.of(context).size.width / 4,
                            child: RecommendedProductWidget(
                              product: recommendedProductListFilter[index],
                              onPressed: () {
                                product = recommendedProductListFilter[index];
                                setState(() {});
                              },
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 12,
                          ),
                          itemCount: recommendedProductListFilter.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
