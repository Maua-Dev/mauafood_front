import 'package:flutter/material.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/ui/pages/product_info_page_phone.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/ui/pages/product_info_page_tablet.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';

import '../../../../../shared/domain/entities/product.dart';

class ProductInfoPage extends StatelessWidget {
  final List<Product> recommendedProductList;
  const ProductInfoPage({
    super.key,
    required this.recommendedProductList,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenHelper.width(context) < 500
        ? ProductInfoPagePhone(recommendedProductList: recommendedProductList)
        : ProductInfoPageTablet(recommendedProductList: recommendedProductList);
  }
}
