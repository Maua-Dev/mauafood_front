import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/register/register_controller.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../widgets/checkbox_field_login_widget.dart';
import '../widgets/register_button_widget.dart';
import '../widgets/text_button_login_widget.dart';
import '../widgets/text_field_login_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var registerController = Modular.get<RegisterController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor2,
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).registerTitle,
                    style: AppTextStyles.h2HighlightBold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldLoginWidget(
                    keyboardType: TextInputType.name,
                    validator: registerController.validateName,
                    onChanged: registerController.setFullName,
                    hintText: S.of(context).fullNameTitle,
                  ),
                  TextFieldLoginWidget(
                    keyboardType: TextInputType.number,
                    validator: registerController.validateCpf,
                    onChanged: registerController.setCpf,
                    inputFormatters: [
                      MaskTextInputFormatter(
                          mask: "###.###.###-##",
                          filter: {"#": RegExp(r'[0-9]')})
                    ],
                    hintText: S.of(context).cpfTitle,
                  ),
                  TextFieldLoginWidget(
                    keyboardType: TextInputType.emailAddress,
                    hintText: S.of(context).emailTitle,
                    validator: registerController.validateEmail,
                    onChanged: registerController.setEmail,
                    autoFillHints: const [
                      AutofillHints.email,
                    ],
                  ),
                  TextFieldLoginWidget(
                    hintText: S.of(context).passwordTitle,
                    validator: registerController.validatePassword,
                    onChanged: registerController.setPassword,
                    keyboardType: TextInputType.emailAddress,
                    autoFillHints: const [
                      AutofillHints.password,
                    ],
                  ),
                  TextFieldLoginWidget(
                    hintText: S.of(context).confirmPasswordTitle,
                    validator: registerController.validateConfirmPassword,
                    onChanged: registerController.setConfirmPassword,
                    keyboardType: TextInputType.emailAddress,
                    autoFillHints: const [
                      AutofillHints.password,
                    ],
                  ),
                  CheckboxFieldLoginWidget(
                    value: registerController.emailNotification,
                    onChanged: registerController.setEmailNotification,
                    title: RichText(
                      text: TextSpan(
                          text: S
                              .of(context)
                              .notificationsOptionsSchema('normalPart'),
                          style: AppTextStyles.h2
                              .copyWith(fontSize: 14, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: S
                                  .of(context)
                                  .notificationsOptionsSchema('email'),
                              style: AppTextStyles.h2HighlightBold
                                  .copyWith(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: S.of(context).questionMark,
                              style: AppTextStyles.h2
                                  .copyWith(fontSize: 14, color: Colors.black),
                            ),
                          ]),
                    ),
                  ),
                  CheckboxFieldLoginWidget(
                    value: registerController.appNotification,
                    onChanged: registerController.setAppNotification,
                    title: RichText(
                      text: TextSpan(
                          text: S
                              .of(context)
                              .notificationsOptionsSchema('normalPart'),
                          style: AppTextStyles.h2
                              .copyWith(fontSize: 14, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: S
                                  .of(context)
                                  .notificationsOptionsSchema('app'),
                              style: AppTextStyles.h2HighlightBold
                                  .copyWith(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: S.of(context).questionMark,
                              style: AppTextStyles.h2
                                  .copyWith(fontSize: 14, color: Colors.black),
                            ),
                          ]),
                    ),
                  ),
                  CheckboxFieldLoginWidget(
                    value: registerController.acceptTerms,
                    onChanged: registerController.setAcceptTerms,
                    title: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => {
                          launchUrl(
                            Uri.parse(
                                'https://maua.br/a-maua/politica-de-privacidade'),
                            mode: LaunchMode.externalApplication,
                          ),
                        },
                        child: Text(
                          S.of(context).appAcceptTerms,
                          style: AppTextStyles.h2HighlightBold.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RegisterButtonWidget(
                    onPressed: () {
                      registerController.registerUser();
                    },
                    title: S.of(context).registerTitle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButtonLoginWidget(
                    onPressed: () {
                      Modular.to.popUntil(ModalRoute.withName('/login'));
                    },
                    text: S.of(context).haveAccountTitle,
                    highlightText: S.of(context).enterTitle,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
