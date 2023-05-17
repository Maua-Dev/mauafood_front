import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/forgot-password/forgot_password_bloc.dart';
import '../widgets/login_button_widget.dart';
import '../widgets/text_button_login_widget.dart';
import '../widgets/text_field_login_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  final AuthBloc authBloc;
  const ForgotPasswordPage({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor2,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => Modular.get<ForgotPasswordBloc>(),
            ),
          ],
          child: Builder(builder: (context) {
            final forgotPasswordFormBloc =
                BlocProvider.of<ForgotPasswordBloc>(context);
            return BlocProvider.value(
              value: authBloc,
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthConfirmResetState) {
                    Modular.to.pushNamed('/login/change-password', arguments: [
                      authBloc,
                      forgotPasswordFormBloc.email.value
                    ]);
                  }
                },
                child: FormBlocListener<ForgotPasswordBloc, String, String>(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 64),
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
                            TextFieldLoginWidget(
                              textFieldBloc: forgotPasswordFormBloc.email,
                              title: S.of(context).emailTitle,
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            LoginButtonWidget(
                              onPressed: () async {
                                forgotPasswordFormBloc.submit();
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
                          ]),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
