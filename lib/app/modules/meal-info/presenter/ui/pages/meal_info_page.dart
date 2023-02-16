import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/generated/l10n.dart';
import '../widgets/recommended_meal_widget.dart';

class MealInfoPage extends StatelessWidget {
  final Meal mealInfo;
  final List<Meal> recommendedMealList;
  const MealInfoPage(
      {super.key, required this.mealInfo, required this.recommendedMealList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.red,
                  // child: Image.network(
                  //   mealInfo.photo,
                  //   fit: BoxFit.contain,
                  //   loadingBuilder: (BuildContext context, Widget child,
                  //       ImageChunkEvent? loadingProgress) {
                  //     if (loadingProgress == null) return child;
                  //     return Center(
                  //       child: CircularProgressIndicator(
                  //         value: loadingProgress.expectedTotalBytes != null
                  //             ? loadingProgress.cumulativeBytesLoaded /
                  //                 loadingProgress.expectedTotalBytes!
                  //             : null,
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Modular.to.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.mainBlueColor,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mealInfo.name,
                        style: AppTextStyles.h1,
                      ),
                      Text(
                        S.of(context).mealPriceCurrency(mealInfo.price),
                        style: AppTextStyles.h1.copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        mealInfo.description,
                        style: AppTextStyles.h3
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        S.of(context).recommendationsTitle,
                        style: AppTextStyles.h1.copyWith(fontSize: 22),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 100,
                            child: RecommendedMealWidget(
                              meal: recommendedMealList[0],
                              onPressed: () {
                                Modular.to.pushNamed('/user/meal-info',
                                    arguments: [
                                      recommendedMealList[0],
                                      recommendedMealList
                                    ]);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                            height: 150,
                            width: 100,
                            child: RecommendedMealWidget(
                              meal: recommendedMealList[1],
                              onPressed: () {
                                Modular.to.pushNamed('/user/meal-info',
                                    arguments: [
                                      recommendedMealList[1],
                                      recommendedMealList
                                    ]);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                            height: 150,
                            width: 100,
                            child: RecommendedMealWidget(
                              meal: recommendedMealList[2],
                              onPressed: () {
                                Modular.to.pushNamed('/user/meal-info',
                                    arguments: [
                                      recommendedMealList[2],
                                      recommendedMealList
                                    ]);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
