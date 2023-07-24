import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../../presenter/controllers/landing_controller.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key, required this.controller});

  final LandingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.only(
        left: ScreenHelper.width(context) * 0.05,
        right: ScreenHelper.width(context) * 0.05,
      ),
      decoration: BoxDecoration(
          color: AppColors.mainBlueColor,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Observer(builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              controller.index == 0
                  ? Container(
                      height: 50,
                      width: 125,
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor2,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(FontAwesomeIcons.house,
                                color: AppColors.mainBlueColor, size: 26),
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: AppColors.mainBlueColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ))
                  : IconButton(
                      onPressed: () {
                        controller.selectIndex(0);
                        Modular.to.navigate('/landing/restaurants/');
                      },
                      padding: const EdgeInsets.all(0),
                      icon: Icon(
                        FontAwesomeIcons.house,
                        color: AppColors.backgroundColor2,
                        size: 26,
                      )),
              controller.index == 1
                  ? Container(
                      height: 50,
                      width: 125,
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor2,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(FontAwesomeIcons.cartPlus,
                                color: AppColors.mainBlueColor, size: 26),
                            Text(
                              "Cesta",
                              style: TextStyle(
                                  color: AppColors.mainBlueColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ))
                  : IconButton(
                      onPressed: () {
                        controller.selectIndex(1);
                        Modular.to.navigate('/landing/cart/');
                      },
                      padding: const EdgeInsets.all(0),
                      icon: Icon(FontAwesomeIcons.cartPlus,
                          color: AppColors.backgroundColor2, size: 26)),
              controller.index == 2
                  ? Container(
                      height: 50,
                      width: 125,
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor2,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.person_outline_outlined,
                                color: AppColors.mainBlueColor, size: 40),
                            Text(
                              "Perfil",
                              style: TextStyle(
                                  color: AppColors.mainBlueColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ))
                  : IconButton(
                      onPressed: () {
                        controller.selectIndex(2);
                        Modular.to.navigate('/landing/profile/');
                      },
                      padding: const EdgeInsets.all(0),
                      icon: Icon(
                        Icons.person_outline_outlined,
                        color: AppColors.backgroundColor2,
                        size: 40,
                      )),
              controller.index == 3
                  ? Container(
                      height: 50,
                      width: 125,
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor2,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(FontAwesomeIcons.circleQuestion,
                                color: AppColors.mainBlueColor, size: 30),
                            Text(
                              "Ajuda",
                              style: TextStyle(
                                  color: AppColors.mainBlueColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ))
                  : IconButton(
                      onPressed: () {
                        controller.selectIndex(3);
                        Modular.to.navigate('/landing/faq/');
                      },
                      padding: const EdgeInsets.all(0),
                      icon: Icon(FontAwesomeIcons.circleQuestion,
                          color: AppColors.backgroundColor2, size: 30))
            ],
          );
        }),
      ),
    );
  }
}
