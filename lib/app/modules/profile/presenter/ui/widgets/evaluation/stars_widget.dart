import 'package:flutter/material.dart';
import 'package:mauafood_front/app/modules/profile/presenter/controllers/popup_controller.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

// ignore: must_be_immutable
class StarsWidget extends StatelessWidget {
  StarsWidget({super.key, required this.controller});
  PopupStore controller;

  @override
  Widget build(BuildContext context) {
    double iconSize = 56;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => controller.setStars(1),
            child: Icon(
                controller.grade >= 1
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                size: iconSize,
                weight: 0.01,
                color: controller.grade != 0
                    ? AppColors.mainBlueColor
                    : Colors.grey),
          ),
          GestureDetector(
            onTap: () => controller.setStars(2),
            child: Icon(
                controller.grade >= 2
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                size: iconSize,
                color: controller.grade != 0
                    ? AppColors.mainBlueColor
                    : Colors.grey),
          ),
          GestureDetector(
            onTap: () => controller.setStars(3),
            child: Icon(
                controller.grade >= 3
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                size: iconSize,
                color: controller.grade != 0
                    ? AppColors.mainBlueColor
                    : Colors.grey),
          ),
          GestureDetector(
            onTap: () => controller.setStars(4),
            child: Icon(
                controller.grade >= 4
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                size: iconSize,
                color: controller.grade != 0
                    ? AppColors.mainBlueColor
                    : Colors.grey),
          ),
          GestureDetector(
            onTap: () => controller.setStars(5),
            child: Icon(
                controller.grade == 5
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                size: iconSize,
                color: controller.grade != 0
                    ? AppColors.mainBlueColor
                    : Colors.grey),
          ),
        ],
      ),
    );
  }
}
