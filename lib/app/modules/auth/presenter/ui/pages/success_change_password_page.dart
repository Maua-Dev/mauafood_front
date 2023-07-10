import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../widgets/button_widget.dart';

class SuccessChangePasswordPage extends StatelessWidget {
  const SuccessChangePasswordPage({super.key});

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
                  height: ScreenHelper.height(context) / 3,
                  child: Image.network(
                    transparentLogo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                S.of(context).successChangePassword,
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
                title: S.of(context).loginTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
