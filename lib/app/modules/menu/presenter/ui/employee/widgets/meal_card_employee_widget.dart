import 'package:flutter/material.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/utils/utils.dart';
import '../../../../../../shared/widgets/circular_progress_indicator_custom_widget.dart';
import '../../../../domain/entities/product.dart';

class MealCardEmployeeWidget extends StatelessWidget {
  final Product meal;
  const MealCardEmployeeWidget({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          child: Stack(
            children: [
              Padding(
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
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
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
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            meal.name,
                            style: AppTextStyles.h1.copyWith(
                                fontSize: 20, color: AppColors.mainBlueColor),
                          ),
                          meal.description == ''
                              ? const SizedBox(
                                  height: 16,
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    meal.description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.h2.copyWith(
                                        color: AppColors.mainBlueColor),
                                  ),
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).mealPriceCurrency(meal.price),
                                style: AppTextStyles.h2.copyWith(
                                    fontSize: 18,
                                    color: AppColors.mainBlueColor),
                              ),
                              meal.prepareTime == null
                                  ? const SizedBox.shrink()
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.timer_sharp,
                                          color: AppColors.mainBlueColor,
                                          size: 24,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          S.of(context).mealPrepareTimeMinutes(
                                              '', meal.prepareTime.toString()),
                                          style: AppTextStyles.h2.copyWith(
                                              fontSize: 18,
                                              color: AppColors.mainBlueColor),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Icon(
                  Icons.edit,
                  color: AppColors.mainBlueColor,
                  size: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
