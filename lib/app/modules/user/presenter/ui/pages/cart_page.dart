import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_text_styles.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({super.key, this.product, this.productPrice, this.productPhoto});

  OrderProductModel? product;
  double? productPrice;
  String? productPhoto;

  @override
  Widget build(BuildContext context) {
    if (product == null) {
      product = OrderProductModel.newInstance();
      productPrice = 0;
    }

    return Stack(
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
          'Funcionalidade em Construção',
          style: AppTextStyles.h2,
        ),
        Positioned(
            top: 60,
            child: Text(
                "Produto: ${product?.name} \n Quantidade: ${product?.quantity} \n ${product?.observation} Price: ${productPrice! * product!.quantity}")),
        SizedBox(
          height: 200,
          width: 200,
          child: CachedNetworkImage(
            imageUrl: productPhoto!,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
