import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_text_styles.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({super.key, required this.product, required this.productPrice});

  OrderProductModel product;
  double productPrice;

  @override
  Widget build(BuildContext context) {
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
                "Produto: ${product.name} \n Quantidade: ${product.quantity} \n ${product.observation} Price: ${productPrice * product.quantity}"))
      ],
    );
  }
}
