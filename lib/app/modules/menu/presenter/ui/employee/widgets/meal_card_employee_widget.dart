import 'package:flutter/material.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/utils/utils.dart';
import '../../../../../../shared/widgets/circular_progress_indicator_custom_widget.dart';
import '../../../../domain/entities/meal_entity.dart';

class MealCardEmployeeWidget extends StatelessWidget {
  final Meal meal;
  const MealCardEmployeeWidget({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                SizedBox(
                  width: Utils.width(context) / 3.5,
                  height: Utils.width(context) / 3.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(
                        meal.photo,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: CircularProgressIndicatorCustomWidget(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        meal.name,
                        style: AppTextStyles.h1.copyWith(
                            fontSize: 20, color: AppColors.mainBlueColor),
                      ),
                    ),
                    Text(
                      meal.description,
                      style: AppTextStyles.h2.copyWith(
                          fontSize: 18, color: AppColors.mainBlueColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          meal.price.toString(),
                          style: AppTextStyles.h2.copyWith(
                              fontSize: 18, color: AppColors.mainBlueColor),
                        ),
                        Text(
                          meal.prepareTime.toString(),
                          style: AppTextStyles.h2.copyWith(
                              fontSize: 18, color: AppColors.mainBlueColor),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
