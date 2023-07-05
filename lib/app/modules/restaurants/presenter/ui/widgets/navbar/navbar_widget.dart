import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauafood_front/app/shared/domain/enums/pages_enum.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class NavBarWidget extends StatelessWidget {
   NavBarWidget({super.key});

  PageEnum page = PageEnum.profile;

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(12),
            margin: EdgeInsets.only(left: ScreenHelper.width(context) * 0.05, right: ScreenHelper.width(context) * 0.05, bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.mainBlueColor,
              borderRadius: const BorderRadius.all(Radius.circular(6))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                page == PageEnum.home ? Container(height: 50, width: 125, decoration: BoxDecoration(color: AppColors.backgroundColor2, borderRadius: BorderRadius.circular(12)), child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[Icon(FontAwesomeIcons.house, color: AppColors.mainBlueColor, size: 26), Text("Home", style: TextStyle(color: AppColors.mainBlueColor, fontSize: 16, fontWeight: FontWeight.bold),)],),
                )) : IconButton(onPressed: null, padding: const EdgeInsets.all(0), icon: Icon(FontAwesomeIcons.house, color: AppColors.backgroundColor2, size: 26,)),
                page == PageEnum.cart ? Container(height: 50, width: 125, decoration: BoxDecoration(color: AppColors.backgroundColor2, borderRadius: BorderRadius.circular(12)), child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[Icon(FontAwesomeIcons.cartPlus, color: AppColors.mainBlueColor, size: 26), Text("Cesta", style: TextStyle(color: AppColors.mainBlueColor, fontSize: 16, fontWeight: FontWeight.bold),)],),
                )) : IconButton(onPressed: null, padding: const EdgeInsets.all(0), icon: Icon(FontAwesomeIcons.cartPlus, color: AppColors.backgroundColor2, size: 26)),
                page == PageEnum.profile ? Container(height: 50, width: 125, decoration: BoxDecoration(color: AppColors.backgroundColor2, borderRadius: BorderRadius.circular(12)), child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[Icon(Icons.person_outline_outlined, color: AppColors.mainBlueColor, size: 40), Text("Perfil", style: TextStyle(color: AppColors.mainBlueColor, fontSize: 16, fontWeight: FontWeight.bold),)],),
                )) : IconButton(onPressed: null, padding: const EdgeInsets.all(0), icon: Icon(Icons.person_outline_outlined,color: AppColors.backgroundColor2, size: 40,)),
                page == PageEnum.faq ? Container(height: 50, width: 125, decoration: BoxDecoration(color: AppColors.backgroundColor2, borderRadius: BorderRadius.circular(12)), child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[Icon(FontAwesomeIcons.circleQuestion, color: AppColors.mainBlueColor, size: 30), Text("Ajuda", style: TextStyle(color: AppColors.mainBlueColor, fontSize: 16, fontWeight: FontWeight.bold),)],),
                )) : IconButton(onPressed: null, padding: const EdgeInsets.all(0), icon: Icon(FontAwesomeIcons.circleQuestion, color: AppColors.backgroundColor2, size: 30))],),
            ),
          );
  }
}