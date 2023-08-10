import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/landing/presenter/controllers/landing_controller.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class NavBarComponentWidget extends StatelessWidget {
  final int index;
  final LandingController controller;
  const NavBarComponentWidget(
      {super.key, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return controller.index == index
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
                    Icon(controller.navbar[index]!['icon'],
                        color: AppColors.mainBlueColor, size: 30),
                    Text(
                      controller.navbar[index]!['title'],
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
                controller.selectIndex(index);
                Modular.to.navigate(controller.navbar[index]!['route']);
              },
              padding: const EdgeInsets.all(0),
              icon: Icon(controller.navbar[index]!['icon'],
                  color: AppColors.backgroundColor2, size: 30));
    });
  }
}
