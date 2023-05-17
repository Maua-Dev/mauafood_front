import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/generated/l10n.dart';
import '../../../../../shared/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../controllers/resend_confirmation/resend_confirmation_controller.dart';
import '../widgets/register_button_widget.dart';
import '../widgets/text_button_login_widget.dart';
import '../widgets/text_field_login_widget.dart';

class ResendConfirmationCodePage extends StatefulWidget {
  const ResendConfirmationCodePage({super.key});

  @override
  State<ResendConfirmationCodePage> createState() =>
      _ResendConfirmationCodePageState();
}

class _ResendConfirmationCodePageState
    extends State<ResendConfirmationCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        var controller = Modular.get<ResendConfirmationController>();
        return SingleChildScrollView(
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
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.network(
                    transparentLogo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                S.of(context).resendConfirmationCodeTitle,
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
                return TextFieldLoginWidget(
                  title: S.of(context).emailTitle,
                  onChanged: controller.setEmail,
                  validator: controller.validateEmail,
                );
              }),
              const SizedBox(
                height: 48,
              ),
              Observer(builder: (_) {
                return RegisterButtonWidget(
                  onPressed: () {
                    controller.resendConfirmationCode();
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
        );
      }),
    );
  }
}
