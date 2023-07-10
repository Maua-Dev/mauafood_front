import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/login/login_controller.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/text_field_widget.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../widgets/login_button_widget.dart';
import '../widgets/text_button_login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var loginController = Modular.get<LoginController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor2,
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).loginTitle,
                            style: AppTextStyles.h2HighlightBold.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Observer(builder: (_) {
                            return TextFieldWidget(
                              onChanged: loginController.setEmail,
                              validator: loginController.validateEmail,
                              title: S.of(context).emailTitle,
                            );
                          }),
                          Observer(builder: (_) {
                            return TextFieldWidget(
                              onChanged: loginController.setPassword,
                              validator: loginController.validatePassword,
                              title: S.of(context).passwordTitle,
                              keyboardType: TextInputType.visiblePassword,
                              autoFillHints: const [
                                AutofillHints.password,
                              ],
                            );
                          }),
                          const SizedBox(
                            height: 8,
                          ),
                          Observer(builder: (_) {
                            return LoginButtonWidget(
                              onPressed: () async {
                                await loginController.loginWithEmail();
                              },
                              title: S.of(context).enterTitle,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  TextButtonLoginWidget(
                    onPressed: () {
                      Modular.to.pushNamed(
                        '/login/forgot-password',
                      );
                    },
                    highlightText: S.of(context).forgotPasswordTitle,
                  ),
                  TextButtonLoginWidget(
                    onPressed: () {
                      Modular.to.pushNamed('/login/resend-code');
                    },
                    highlightText: S.of(context).emailConfirmationTitle,
                  ),
                  TextButtonLoginWidget(
                    onPressed: () {
                      Modular.to.pushNamed('/login/register');
                    },
                    highlightText: S.of(context).registerTitle,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
