import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/menu/user_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

import 'package:mauafood_front/generated/l10n.dart';

import '../widgets/recommended_product_widget.dart';

class ProductInfoPage extends StatefulWidget {
  final Product productInfo;
  final List<Product> recommendedProductList;

  const ProductInfoPage(
      {super.key,
      required this.productInfo,
      required this.recommendedProductList});

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  final store = Modular.get<UserMenuRestaurantController>();
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
          )),
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
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        spreadRadius: 4,
                        offset: Offset(0, -4), // Shadow position
                      ),
                    ],
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
                              S.of(context).productPriceCurrency(product.price),
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
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              S.of(context).recommendedTitle,
                              style: AppTextStyles.h2
                                  .copyWith(color: AppColors.mainBlueColor),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SafeArea(
                        child: SizedBox(
                      height: 160,
                      child: ListView.separated(
                        itemBuilder: (context, index) => SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width / 4,
                          child: RecommendedProductWidget(
                            product: recommendedProductListFilter[index],
                            onPressed: () {
                              product = recommendedProductListFilter[index];

                              setState(() {});
                              // Modular.to.popAndPushNamed('./', arguments: [
                              //   recommendedProductListFilter[index],
                              //   widget.recommendedProductList
                              // ]);
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
                    ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
