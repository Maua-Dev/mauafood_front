import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/widgets/text_field_widget.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../controllers/change_password/change_password_controller.dart';
import '../widgets/login_button_widget.dart';
import '../widgets/text_button_login_widget.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      body: Builder(builder: (context) {
        final controller = Modular.get<ChangePasswordController>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  S.of(context).changePasswordTitle,
                  style: AppTextStyles.h2HighlightBold.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  S.of(context).sendCodeEmailInstructionsTitle,
                  style: AppTextStyles.h2
                      .copyWith(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldWidget(
                  title: S.of(context).codeTitle,
                  keyboardType: TextInputType.number,
                  onChanged: controller.setCode,
                  validator: controller.validateCode,
                ),
                TextFieldWidget(
                  title: S.of(context).newPasswordTitle,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: controller.setNewPassword,
                  validator: controller.validatePassword,
                  autoFillHints: const [
                    AutofillHints.password,
                  ],
                ),
                TextFieldWidget(
                  title: S.of(context).confirmNewPasswordTitle,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: controller.setConfirmNewPassword,
                  validator: controller.validateConfirmPassword,
                  autoFillHints: const [
                    AutofillHints.password,
                  ],
                ),
                const SizedBox(
                  height: 36,
                ),
                LoginButtonWidget(
                  onPressed: () async {
                    controller.changePassword();
                  },
                  title: S.of(context).sendTitle,
                ),
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
              ],
            ),
          ),
        );
      }),
    );
  }
}
