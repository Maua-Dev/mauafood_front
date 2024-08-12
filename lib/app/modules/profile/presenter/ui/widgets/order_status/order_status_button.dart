import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class OrderStatusButton extends StatelessWidget {
  const OrderStatusButton(
      {super.key, required this.abortOrder, required this.buttonTitle});

  final Function abortOrder;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: ElevatedButton(
        onPressed: () {
          abortOrder();
        },
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: AppColors.mainBlueColor),
        child: Text(
          buttonTitle,
          style: AppTextStyles.h2HighlightBold.copyWith(
            color: AppColors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
