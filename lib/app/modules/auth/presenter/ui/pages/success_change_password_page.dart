import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';

class SuccessChangePasswordPage extends StatelessWidget {
  const SuccessChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                child: Image.asset(
                  'assets/images/logos/transparent_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              'Senha alterada com sucesso!',
              style: AppTextStyles.h2HighlightBold.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            ElevatedButton(
              onPressed: () async {
                Modular.to.popUntil(ModalRoute.withName('/login'));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                'Login',
                style: AppTextStyles.h2HighlightBold.copyWith(
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
