import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../widgets/button_widget.dart';

class SuccessConfirmPage extends StatelessWidget {
  const SuccessConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                'E-mail confirmado!',
                style: AppTextStyles.h2HighlightBold.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              ButtonWidget(
                onPressed: () async {
                  Modular.to.popUntil(ModalRoute.withName('/login'));
                },
                title: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
