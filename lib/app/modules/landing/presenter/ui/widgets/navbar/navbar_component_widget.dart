import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class NavBarComponentWidget extends StatelessWidget {
  final int index;
  final IconData icon;
  final String title;
  final String route;
  final Function(int) onSelect;
  final int selectIndex;
  const NavBarComponentWidget(
      {super.key,
      required this.index,
      required this.icon,
      required this.title,
      required this.route,
      required this.onSelect,
      required this.selectIndex});

  @override
  Widget build(BuildContext context) {
    return selectIndex == index
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
                  Icon(icon, color: AppColors.mainBlueColor, size: 30),
                  Text(
                    title,
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
              onSelect(index);
              Modular.to.navigate(route);
            },
            padding: const EdgeInsets.all(0),
            icon: Icon(icon, color: AppColors.backgroundColor2, size: 30));
  }
}
