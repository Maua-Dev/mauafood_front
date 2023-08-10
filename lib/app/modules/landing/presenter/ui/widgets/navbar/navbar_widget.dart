import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:mauafood_front/app/modules/landing/presenter/ui/widgets/navbar/navbar_component_widget.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../../controllers/landing_controller.dart';

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
        child: Observer(builder: (context) {
          final navbar = controller.navbar;
          final navbarLenght = navbar.length;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                navbarLenght,
                (index) => NavBarComponentWidget(
                      icon: navbar[index]['icon'],
                      index: index,
                      onSelect: controller.selectIndex,
                      route: navbar[index]['route'],
                      title: navbar[index]['title'],
                      selectIndex: controller.index,
                    )),
          );
        }),
      ),
    );
  }
}
