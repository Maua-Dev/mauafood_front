import 'package:flutter/material.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/ui/pages/product_info_page_phone.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/ui/pages/product_info_page_tablet.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/menu/user_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

import 'package:mauafood_front/generated/l10n.dart';

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
