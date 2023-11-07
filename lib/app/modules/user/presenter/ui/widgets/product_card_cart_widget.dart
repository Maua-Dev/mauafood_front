import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
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
      height: widget.product.observation.isEmpty ? 135 : 165,
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: widget.product.photo,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, bottom: 8),
                                  child: Text(
                                    widget.product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.h2.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            ScreenHelper.width(context) > 400
                                                ? 20
                                                : 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          widget.product.observation.isNotEmpty
                              ? Container(
                                  constraints: BoxConstraints.tight(Size(
                                      ScreenHelper.width(context) * 0.6, 30)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[350],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 8.0, top: 4),
                                    child: Text(
                                      widget.product.observation,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 100, 100, 100),
                                          fontSize:
                                              ScreenHelper.width(context) > 400
                                                  ? 20
                                                  : 16),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          const Spacer(),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
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
                                              color: AppColors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Text(
                                        widget.product.quantity.toString(),
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16),
                                      ),
                                      TextButton(
                                        onPressed: widget.onAdd,
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  S.of(context).productPriceCurrency(
                                      widget.product.price *
                                          widget.product.quantity),
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.h2Highlight.copyWith(
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
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
