import 'package:flutter/material.dart';

import '../../../../menu/domain/entities/meal_entity.dart';

class RecommendationCardWidget extends StatelessWidget {
  final Meal mealInfo;
  const RecommendationCardWidget({super.key, required this.mealInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 175,
        child: Image.network(
          mealInfo.photo,
          fit: BoxFit.contain,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
