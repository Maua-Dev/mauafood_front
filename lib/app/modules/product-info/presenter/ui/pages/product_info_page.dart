import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/generated/l10n.dart';
import '../widgets/recommended_product_widget.dart';

class ProductInfoPage extends StatelessWidget {
  final Product productInfo;
  final List<Product> recommendedProductList;
  const ProductInfoPage(
      {super.key,
      required this.productInfo,
      required this.recommendedProductList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    productInfo.photo,
                    fit: BoxFit.contain,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Modular.to.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.mainBlueColor,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productInfo.name,
                        style: AppTextStyles.h1,
                      ),
                      Text(
                        S.of(context).productPriceCurrency(productInfo.price),
                        style: AppTextStyles.h1.copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        productInfo.description,
                        style: AppTextStyles.h3
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (recommendedProductList.length > 1)
                        Text(
                          S.of(context).recommendationsTitle,
                          style: AppTextStyles.h1.copyWith(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (recommendedProductList.length > 1)
                            SizedBox(
                              height: 150,
                              width: MediaQuery.of(context).size.width / 4,
                              child: RecommendedProductWidget(
                                product: recommendedProductList[0],
                                onPressed: () {
                                  Modular.to.pushNamed('/user/meal-info',
                                      arguments: [
                                        recommendedProductList[0],
                                        recommendedProductList
                                      ]);
                                },
                              ),
                            ),
                          const SizedBox(
                            width: 12,
                          ),
                          if (recommendedProductList.length > 1)
                            SizedBox(
                              height: 150,
                              width: MediaQuery.of(context).size.width / 4,
                              child: RecommendedProductWidget(
                                product: recommendedProductList[1],
                                onPressed: () {
                                  Modular.to.pushNamed('/user/meal-info',
                                      arguments: [
                                        recommendedProductList[1],
                                        recommendedProductList
                                      ]);
                                },
                              ),
                            ),
                          const SizedBox(
                            width: 12,
                          ),
                          if (recommendedProductList.length > 2)
                            SizedBox(
                              height: 150,
                              width: MediaQuery.of(context).size.width / 4,
                              child: RecommendedProductWidget(
                                product: recommendedProductList[2],
                                onPressed: () {
                                  Modular.to.pushNamed('/user/meal-info',
                                      arguments: [
                                        recommendedProductList[2],
                                        recommendedProductList
                                      ]);
                                },
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
