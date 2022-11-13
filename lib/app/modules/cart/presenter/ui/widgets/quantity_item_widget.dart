import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';

class QuantityItemWidget extends StatelessWidget {
  final String quantity;
  final Function()? addQuantity;
  final Function()? removeQuantity;
  const QuantityItemWidget(
      {super.key,
      required this.quantity,
      this.addQuantity,
      this.removeQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.buttonsColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: removeQuantity,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 10,
            ),
            icon: Icon(
              Icons.remove,
              color: AppColors.white,
              size: 24,
            ),
          ),
          Text(
            quantity,
            style:
                AppTextStyles.h2.copyWith(fontSize: 18, color: AppColors.white),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: addQuantity,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 10,
            ),
            icon: Icon(
              Icons.add,
              color: AppColors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
