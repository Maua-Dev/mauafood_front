import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class AppTextStyles {
  static TextStyle h1 = TextStyle(
    color: AppColors.letterColor,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );
  static TextStyle h2 = TextStyle(
    color: AppColors.letterColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static TextStyle h2Thin = TextStyle(
    color: AppColors.letterThinColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static TextStyle h2Highlight = TextStyle(
    color: AppColors.mainBlueColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static TextStyle h2HighlightBold = TextStyle(
    color: AppColors.mainBlueColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle h2ThinHighlight = TextStyle(
    color: AppColors.mainBlueColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}
