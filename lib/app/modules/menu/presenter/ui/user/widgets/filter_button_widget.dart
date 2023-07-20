import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import '../../../../../../shared/domain/enums/product_enum.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class FilterButtonWidget extends StatelessWidget {
  final int myIndex;
  final int actualIndex;
  final Function()? onPressed;
  const FilterButtonWidget(
      {super.key,
      required this.myIndex,
      this.onPressed,
      required this.actualIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: ActionChip(
        elevation: 2,
        backgroundColor:
            actualIndex == myIndex ? AppColors.mainBlueColor : Colors.white,
        onPressed: onPressed,
        label: Text(ProductEnum.values[myIndex].name,
            style: actualIndex == myIndex
                ? AppTextStyles.h2.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.bold)
                : AppTextStyles.h2.copyWith(
                    color: AppColors.mainBlueColor,
                  )),
      ),
    );
  }
}
