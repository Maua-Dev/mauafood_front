import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/widgets/text_field_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../controllers/confirm_email/confirm_email_controller.dart';
import '../widgets/register_button_widget.dart';

class ConfirmEmailPage extends StatelessWidget {
  const ConfirmEmailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<ConfirmEmailController>();
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                      S.of(context).confirmEmailTitle,
                      style: AppTextStyles.h2HighlightBold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      S.of(context).registerEmailInstructionsTitle,
                      style: AppTextStyles.h2
                          .copyWith(color: Colors.black, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Observer(builder: (_) {
                      return TextFieldWidget(
                        keyboardType: TextInputType.number,
                        onChanged: controller.setCode,
                        validator: controller.validateCode,
                        title: S.of(context).codeTitle,
                      );
                    }),
                    const SizedBox(
                      height: 48,
                    ),
                    Observer(builder: (_) {
                      return RegisterButtonWidget(
                        onPressed: () {
                          controller.confirmEmail();
                        },
                        title: S.of(context).confirmTitle,
                      );
                    }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
