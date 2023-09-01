import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/domain/entities/product.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final Function()? onPressed;

  const ProductCardWidget({
    Key? key,
    required this.product,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
                  child: InkWell(
                    onLongPress: product.photo != '' && product.photo != null
                        ? () => showDialog(
                            context: context,
                            builder: ((context) => AlertDialog(
                                  content: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          ScreenHelper.height(context) * 0.5,
                                      maxWidth:
                                          ScreenHelper.width(context) * 0.5,
                                    ),
                                    child: Image.network(
                                      product.photo!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )))
                        : null,
                    child: CachedNetworkImage(
                      imageUrl: product.photo ?? '',
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
                        Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.h2.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const Spacer(),
                        Text(
                          S.of(context).productPriceCurrency(product.price),
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.h2Highlight.copyWith(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  )),
              Container(
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    color: AppColors.mainBlueColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
