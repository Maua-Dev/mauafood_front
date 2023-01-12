import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/widgets/meal_list_view_widget.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/generated/l10n.dart';

class MealInfoPage extends StatelessWidget {
  final Meal mealInfo;
  const MealInfoPage({super.key, required this.mealInfo});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
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
                  Positioned(
                    left: 16,
                    top: 16,
                    child: ElevatedButton(
                      onPressed: () {
                        Modular.to.pop('/menu');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.letterHighlightThinColor,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
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
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).mealPriceCurrency(mealInfo.price),
                          style: AppTextStyles.h1,
                        ),
                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.access_time,
                        //       color: AppColors.letterHighlightColor,
                        //     ),
                        //     Text(
                        //       '${mealInfo.prepareTime} min',
                        //       style: AppTextStyles.h2Highlight,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      mealInfo.description,
                      style: AppTextStyles.h2Thin,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Text(
                      S.of(context).recommendedTitle,
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
      ),
    );
  }
}
