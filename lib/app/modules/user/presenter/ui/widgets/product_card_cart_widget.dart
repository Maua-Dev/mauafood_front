import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/infra/models/cart_product_model.dart';

// ignore: must_be_immutable
class ProductCardCartWidget extends StatefulWidget {
  CartProductModel product;
  final Function()? onAdd;
  final Function()? onSubtract;
  ProductCardCartWidget({
    Key? key,
    required this.product,
    required this.onAdd,
    required this.onSubtract,
  }) : super(key: key);

  @override
  State<ProductCardCartWidget> createState() => _ProductCardCartWidgetState();
}

class _ProductCardCartWidgetState extends State<ProductCardCartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.product.photo,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.h2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.mainBlueColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: widget.onSubtract,
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: widget.product.quantity != 1
                                                ? AppColors.white
                                                : Colors.grey,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Text(
                                      widget.product.quantity.toString(),
                                      style: TextStyle(
                                          color: AppColors.white, fontSize: 16),
                                    ),
                                    TextButton(
                                      onPressed: widget.onAdd,
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: widget.product.quantity != 1
                                                ? AppColors.white
                                                : Colors.grey,
                                            fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                S
                                    .of(context)
                                    .productPriceCurrency(widget.product.price),
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.h2Highlight.copyWith(
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
