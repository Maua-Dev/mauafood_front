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
  final String? value;
  const NavBarComponentWidget(
      {super.key,
      required this.index,
      required this.icon,
      required this.title,
      required this.route,
      required this.onSelect,
      required this.selectIndex,
      this.value});

  @override
  Widget build(BuildContext context) {
    final isSelect = selectIndex == index;
    return InkWell(
      onTap: () {
        Modular.to.navigate(route, arguments: value);
        selectIndex == index ? onSelect(index) : onSelect(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        height: 50,
        width: isSelect ? 125 : 48,
        padding: EdgeInsets.symmetric(horizontal: isSelect ? 16.0 : 0),
        decoration: BoxDecoration(
            color:
                isSelect ? AppColors.backgroundColor2 : AppColors.mainBlueColor,
            borderRadius: BorderRadius.circular(12)),
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(icon,
                  color: isSelect
                      ? AppColors.mainBlueColor
                      : AppColors.backgroundColor2,
                  size: 30),
              if (isSelect && constraints.minWidth >= 75)
                Text(
                  title,
                  style: TextStyle(
                      color: AppColors.mainBlueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
            ],
          );
        }),
      ),
    );
  }
}
