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
          child: BlocProvider.value(
            value: authBloc,
            child: BlocListener(
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error.message)));
                }
                if (state is AuthLoadedState) {
                  Modular.to
                      .pushNamed('/login/confirm-email', arguments: authBloc);
                }
              },
              child: Builder(
                builder: (context) {
                  final changePasswordFormBloc =
                      BlocProvider.of<ChangePasswordBloc>(context);
                  return FormBlocListener<ChangePasswordBloc, String, String>(
                    onFailure: (context, state) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.failureResponse!)));
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Alterar senha',
                            style: AppTextStyles.h2HighlightBold.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
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
                                changePasswordFormBloc.confirmPassword,
                            title: 'Confirme a nova senha',
                            keyboardType: TextInputType.visiblePassword,
                            suffixButton: SuffixButton.obscureText,
                            autoFillHints: const [
                              AutofillHints.password,
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )),
    );
  }
}
