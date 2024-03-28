import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mauafood_front/app/modules/profile/presenter/controllers/popup_controller.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

// ignore: must_be_immutable
class StarsWidget extends StatelessWidget {
  StarsWidget({super.key, required this.controller});
  PopupStore controller;

// swicth case to change the star icon using the controller variable 
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              controller.setStars(1);
            } ,
            child: Icon(
                controller.grade >= 1 ? Icons.star_rounded : Icons.star_border_rounded,
                size: 48.0,
                color: controller.grade >= 1
                    ? AppColors.lightBlueColor
                    : AppColors.letterColor),
          ),
          GestureDetector(
            onTap: () => controller.setStars(2),
            child: Icon(
              controller.grade >= 1 ? Icons.star_rounded : Icons.star_border_rounded,
                size: 48.0,
                color: controller.grade >= 2
                    ? AppColors.yellowColor
                    : AppColors.letterColor),
          ),
          GestureDetector(
            onTap: () => controller.setStars(3),
            child: Icon(
              controller.grade >= 1 ? Icons.star_rounded : Icons.star_border_rounded,
                size: 48.0,
                color: controller.grade >= 3
                    ? AppColors.yellowColor
                    : AppColors.letterColor),
          ),
          GestureDetector(
            onTap: () => controller.setStars(4),
            child: Icon(
              controller.grade >= 1 ? Icons.star_rounded : Icons.star_border_rounded,
                size: 48.0,
                color: controller.grade >= 4
                    ? AppColors.yellowColor
                    : AppColors.letterColor),
          ),
          GestureDetector(
            onTap: () => controller.setStars(5),
            child: Icon(
              controller.grade >= 1 ? Icons.star_rounded : Icons.star_border_rounded,
                size: 48.0,
                color: controller.grade == 5
                    ? AppColors.yellowColor
                    : AppColors.letterColor),
          ),
        ],
      );
      ;
    });
  }
}
