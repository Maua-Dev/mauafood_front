import 'package:flutter/material.dart';
import 'package:mauafood_front/app/modules/profile/presenter/controllers/popup_controller.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';


// ignore: must_be_immutable
class StarsWidget extends StatelessWidget {
 StarsWidget({super.key, required this.controller});
  PopupStore controller;


  @override
  Widget build(BuildContext context) {

    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => controller.setStars(0),
          child: Icon(Icons.star_border_rounded,
          size:48.0,
          color:controller.stars[0]? AppColors.yellowColor: AppColors.letterColor),
        ),
        Icon(Icons.star_border_rounded,
        size:48.0,
        color:AppColors.letterThinColor,),
        Icon(Icons.star_border_rounded,
        size:48.0,
        color:AppColors.letterThinColor,),
        Icon(Icons.star_border_rounded,
        size:48.0,
        color:AppColors.letterThinColor,),
        Icon(Icons.star_border_rounded,
        size:48.0,
        color:AppColors.letterThinColor,),
      ],
    );
  }
}