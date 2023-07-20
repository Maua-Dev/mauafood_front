import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/domain/entities/product.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final Function()? onPressed;
  final File? mobilePhoto;
  final Uint8List? webPhoto;

  const ProductCardWidget({
    Key? key,
    required this.product,
    this.onPressed,
    this.mobilePhoto,
    this.webPhoto,
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
                  child: product.photo == ''
                      ? kIsWeb && mobilePhoto != null || webPhoto == null
                          ? Image.file(mobilePhoto!)
                          : Image.memory(webPhoto!)
                      : CachedNetworkImage(
                          imageUrl: product.photo,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
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
