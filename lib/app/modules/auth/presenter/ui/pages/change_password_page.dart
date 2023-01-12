import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/change-password/change_password_bloc.dart';
import '../widgets/auth_button_widget.dart';
import '../widgets/text_button_login_widget.dart';
import '../widgets/text_field_login_widget.dart';

class ChangePasswordPage extends StatelessWidget {
  final AuthBloc authBloc;
  const ChangePasswordPage({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => Modular.get<ChangePasswordBloc>(),
            ),
          ],
          child: Builder(builder: (context) {
            final changePasswordFormBloc =
                BlocProvider.of<ChangePasswordBloc>(context);
            return BlocProvider.value(
              value: authBloc,
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthChangePasswordCompleteState) {
                    Modular.to.pushNamed(
                      '/login/success-change-password',
                    );
                  }
                },
                child: FormBlocListener<ChangePasswordBloc, String, String>(
                  onFailure: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.failureResponse!)));
                  },
                  child: SingleChildScrollView(
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
                              height: MediaQuery.of(context).size.height / 3,
                              child: Image.asset(
                                'assets/images/logos/transparent_logo.png',
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
                          TextFieldLoginWidget(
                            textFieldBloc: changePasswordFormBloc.code,
                            title: S.of(context).codeTitle,
                            keyboardType: TextInputType.number,
                          ),
                          TextFieldLoginWidget(
                            textFieldBloc: changePasswordFormBloc.password,
                            title: S.of(context).newPasswordTitle,
                            keyboardType: TextInputType.visiblePassword,
                            suffixButton: SuffixButton.obscureText,
                            autoFillHints: const [
                              AutofillHints.password,
                            ],
                          ),
                          TextFieldLoginWidget(
                            textFieldBloc:
                                changePasswordFormBloc.passwordConfirm,
                            title: S.of(context).confirmNewPasswordTitle,
                            keyboardType: TextInputType.visiblePassword,
                            suffixButton: SuffixButton.obscureText,
                            autoFillHints: const [
                              AutofillHints.password,
                            ],
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          AuthButtonWidget(
                            onPressed: () async {
                              changePasswordFormBloc.submit();
                            },
                            title: S.of(context).sendTitle,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextButtonLoginWidget(
                            onPressed: () {
                              Modular.to
                                  .popUntil(ModalRoute.withName('/login'));
                            },
                            text: S.of(context).havePasswordTitle,
                            highlightText: S.of(context).doLoginTitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
