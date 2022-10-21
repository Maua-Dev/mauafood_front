import 'package:flutter/material.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class MenuAppbarWidget extends StatelessWidget {
  final String restaurantName;
  const MenuAppbarWidget({super.key, required this.restaurantName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Menu - $restaurantName', style: AppTextStyles.h1),
      elevation: 0,
    );
  }
}
