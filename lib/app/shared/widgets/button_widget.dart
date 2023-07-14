import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Color? color;
  const ButtonWidget(
      {super.key, this.onPressed, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: color ?? AppColors.mainBlueColor),
        child: Text(
          title,
          style: AppTextStyles.h2HighlightBold.copyWith(
            color: AppColors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
