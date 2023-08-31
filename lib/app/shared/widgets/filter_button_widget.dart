import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class FilterButtonWidget extends StatelessWidget {
  final String text;
  final bool selected;
  final Function()? onPressed;
  const FilterButtonWidget(
      {super.key, required this.text, this.onPressed, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: ActionChip(
        elevation: 2,
        backgroundColor: selected ? AppColors.mainBlueColor : Colors.white,
        onPressed: onPressed,
        label: Text(text,
            style: selected
                ? AppTextStyles.h2.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.bold)
                : AppTextStyles.h2.copyWith(
                    color: AppColors.mainBlueColor,
                    fontWeight: FontWeight.bold,
                  )),
      ),
    );
  }
}
