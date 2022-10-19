import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_text_styles.dart';
import '../../../domain/enum/meal_enum.dart';

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
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16)),
      child: Text(MealEnum.values[myIndex].name,
          style: blocIndex == myIndex
              ? AppTextStyles.h2Highlight.copyWith(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold)
              : AppTextStyles.h2Thin),
    );
  }
}
