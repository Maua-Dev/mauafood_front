import 'package:flutter/material.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class MenuAppbarWidget extends StatelessWidget {
  const MenuAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Menu - Souza de Abreu', style: AppTextStyles.h1),
      elevation: 0,
    );
  }
}
