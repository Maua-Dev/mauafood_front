import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/generated/l10n.dart';

class OrderStatusButton extends StatelessWidget {
  const OrderStatusButton({super.key, required this.abortOrder});

  final Function abortOrder;

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
          S.of(context).cancelOrderTitle,
          style: AppTextStyles.h2HighlightBold.copyWith(
            color: AppColors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
