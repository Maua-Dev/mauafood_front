import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class CircularProgressIndicatorCustomWidget extends StatelessWidget {
  final double? value;
  const CircularProgressIndicatorCustomWidget({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      color: AppColors.mainBlueColor,
    );
  }
}
