import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mauafood_front/app/shared/domain/entities/product.dart';

import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/like_button_custom.dart';
import '../../../../../../generated/l10n.dart';

class ProductCardWidget extends StatefulWidget {
  final Product product;
  final Function()? onPressed;
  final File? mobilePhoto;
  final Uint8List? webPhoto;
  final Future<bool> Function(bool)? onFavoritePressed;
  final bool isFavorite;
  const ProductCardWidget({
    Key? key,
    required this.product,
    this.onPressed,
    this.mobilePhoto,
    this.webPhoto,
    this.onFavoritePressed,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
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
                  child: widget.product.photo == ''
                      ? widget.mobilePhoto != null || widget.webPhoto != null
                          ? kIsWeb
                              ? Image.file(widget.mobilePhoto!)
                              : Image.memory(widget.webPhoto!)
                          : const Icon(Icons.image_not_supported)
                      : CachedNetworkImage(
                          imageUrl: widget.product.photo ?? '',
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
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            if (widget.onFavoritePressed != null)
                              LikeButtonCustom(
                                isFavorite: widget.isFavorite,
                                onFavoritePressed: widget.onFavoritePressed,
                              )
                          ],
                        ),
                        const Spacer(),
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
