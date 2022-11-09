import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/change-password/change_password_bloc.dart';
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
                            'Alterar senha',
                            style: AppTextStyles.h2HighlightBold.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Enviamos um código de confirmação em seu e-mail, digite-o no campo abaixo.',
                            style: AppTextStyles.h2
                                .copyWith(color: Colors.black, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFieldLoginWidget(
                            textFieldBloc: changePasswordFormBloc.code,
                            title: 'Código',
                          ),
                          TextFieldLoginWidget(
                            textFieldBloc: changePasswordFormBloc.password,
                            title: 'Nova senha',
                            keyboardType: TextInputType.visiblePassword,
                            suffixButton: SuffixButton.obscureText,
                            autoFillHints: const [
                              AutofillHints.password,
                            ],
                          ),
                          TextFieldLoginWidget(
                            textFieldBloc:
                                changePasswordFormBloc.passwordConfirm,
                            title: 'Confirme a nova senha',
                            keyboardType: TextInputType.visiblePassword,
                            suffixButton: SuffixButton.obscureText,
                            autoFillHints: const [
                              AutofillHints.password,
                            ],
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () async {
                                changePasswordFormBloc.submit();
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                              ),
                              child: BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  if (state is AuthLoadingState) {
                                    return CircularProgressIndicator(
                                      color: AppColors.white,
                                    );
                                  }
                                  return Text(
                                    'Enviar',
                                    style:
                                        AppTextStyles.h2HighlightBold.copyWith(
                                      color: AppColors.white,
                                      fontSize: 16,
                                    ),
                                  );
                                },
                              ),
                            ),
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
