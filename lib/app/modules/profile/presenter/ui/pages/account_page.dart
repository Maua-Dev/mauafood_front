import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/presenter/controllers/profile_controller.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController _store = Modular.get();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.mainBlueColor,
        ),
        title: Text(
          'Conta',
          style: AppTextStyles.h1.copyWith(color: AppColors.mainBlueColor),
        ),
        backgroundColor: AppColors.backgroundColor2,
        elevation: 0,
      ),
      body: Column(
        children: [
          // ListTile(
          //   leading: Icon(
          //     Icons.key_rounded,
          //     size: 22,
          //     color: AppColors.mainBlueColor,
          //   ),
          //   title: Text('Alterar Senha', style: AppTextStyles.h2),
          //   onTap: null,
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.person,
          //     size: 22,
          //     color: AppColors.mainBlueColor,
          //   ),
          //   title: const Text('Alterar Nome'),
          //   onTap: null,
          // ),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              size: 22,
              color: AppColors.mainBlueColor,
            ),
            title: const Text('Sair'),
            onTap: _store.logout,
          ),
          // ElevatedButton.icon(
          //   icon: Icon(
          //     Icons.delete_forever_rounded,
          //     size: 22,
          //     color: AppColors.errorColor,
          //   ),
          //   label: const Text('Apagar Conta Dev'),
          //   onPressed: _store.logout,
          // ),
        ],
      ),
    );
  }
}
