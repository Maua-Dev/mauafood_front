import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/widgets/meal_list_view_widget.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class MealInfoPage extends StatelessWidget {
  final Meal mealInfo;
  const MealInfoPage({super.key, required this.mealInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Modular.to.pop('/menu');
              },
              icon: Icon(
                Icons.exit_to_app,
                color: AppColors.letterHighlightColor,
                size: 32,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
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
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealInfo.name,
                    style: AppTextStyles.h1,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mealInfo.price.toString().replaceAll('.', ','),
                        style: AppTextStyles.h1,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: AppColors.letterHighlightColor,
                          ),
                          Text(
                            '${mealInfo.prepareTime} min',
                            style: AppTextStyles.h2Highlight,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    mealInfo.description,
                    style: AppTextStyles.h2,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 110,
                  ),
                  Text(
                    'Recomendados',
                    style: AppTextStyles.h1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return RecommendationCardWidget(
                          mealInfo: mealInfo,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
