import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../domain/enum/meal_enum.dart';

class FilterButtonWidget extends StatelessWidget {
  final int myIndex;
  final int blocIndex;
  final Function()? onPressed;
  const FilterButtonWidget(
      {super.key,
      required this.myIndex,
      this.onPressed,
      required this.blocIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6, bottom: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          fixedSize: const Size(80, 0),
          backgroundColor:
              blocIndex == myIndex ? AppColors.mainBlueColor : Colors.white,
        ),
        onPressed: onPressed,
        child: Text(MealEnum.values[myIndex].name,
            style: blocIndex == myIndex
                ? AppTextStyles.h2Thin.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.bold)
                : AppTextStyles.h2Thin.copyWith(
                    color: AppColors.mainBlueColor,
                  )),
      ),
    );
  }
}