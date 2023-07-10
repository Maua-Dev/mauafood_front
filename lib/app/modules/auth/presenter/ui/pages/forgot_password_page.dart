import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/widgets/text_field_widget.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../controllers/forgot_password/forgot_password_controller.dart';
import '../widgets/login_button_widget.dart';
import '../widgets/text_button_login_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<ForgotPasswordController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor2,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                S.of(context).forgotPasswordTitle,
                style: AppTextStyles.h2HighlightBold.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                S.of(context).confirmationCodeInstructionsTitle,
                style: AppTextStyles.h2
                    .copyWith(color: Colors.black, fontSize: 14),
              ),
              const SizedBox(
                height: 24,
              ),
              Observer(builder: (_) {
                return TextFieldWidget(
                  onChanged: controller.setEmail,
                  validator: controller.validateEmail,
                  title: S.of(context).emailTitle,
                );
              }),
              const SizedBox(
                height: 48,
              ),
              Observer(builder: (_) {
                return LoginButtonWidget(
                  onPressed: () async {
                    controller.forgotPasswordUser();
                  },
                  title: S.of(context).sendTitle,
                );
              }),
              const SizedBox(
                height: 16,
              ),
              TextButtonLoginWidget(
                onPressed: () {
                  Modular.to.popUntil(ModalRoute.withName('/login'));
                },
                text: S.of(context).havePasswordTitle,
                highlightText: S.of(context).doLoginTitle,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
