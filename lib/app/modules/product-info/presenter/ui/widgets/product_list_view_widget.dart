import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/domain/entities/product.dart';

class RecommendationCardWidget extends StatelessWidget {
  final Product productInfo;
  const RecommendationCardWidget({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 175,
        child: CachedNetworkImage(
          imageUrl: productInfo.photo,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
