import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../shared/themes/app_colors.dart';

class ProfileOptionsWidget extends StatelessWidget {
  const ProfileOptionsWidget(
      {super.key, required this.icon, required this.text, required this.route});

  final Icon icon;
  final Text text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Modular.to.navigate(route);
            },
            icon: icon),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(width: 200, child: text),
        ),
        SizedBox(
          width: ScreenHelper.width(context) * 0.21,
        ),
        Icon(
          Icons.keyboard_arrow_right_rounded,
          color: AppColors.mainBlueColor,
        )
      ],
    );
  }
}
