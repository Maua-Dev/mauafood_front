import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/register/register_form_bloc.dart';
import '../widgets/checkbox_field_login_widget.dart';
import '../widgets/text_field_login_widget.dart';

class RegisterPage extends StatefulWidget {
  final AuthBloc authBloc;
  const RegisterPage({super.key, required this.authBloc});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor2,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => Modular.get<RegisterFormBloc>(),
            ),
          ],
          child: BlocProvider.value(
            value: widget.authBloc,
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error.message)));
                }
                if (state is AuthLoadedState) {
                  Modular.to
                      .navigate('/confirm-email', arguments: widget.authBloc);
                }
              },
              child: Builder(
                builder: (context) {
                  final registerFormBloc =
                      BlocProvider.of<RegisterFormBloc>(context);
                  return FormBlocListener<RegisterFormBloc, String, String>(
                    onFailure: (context, state) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.failureResponse!)));
                    },
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cadastre-se',
                              style: AppTextStyles.h2HighlightBold.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFieldLoginWidget(
                              keyboardType: TextInputType.name,
                              textFieldBloc: registerFormBloc.fullName,
                              hintText: 'Nome Completo',
                            ),
                            TextFieldLoginWidget(
                              keyboardType: TextInputType.number,
                              textFieldBloc: registerFormBloc.cpf,
                              inputFormatters: [
                                MaskTextInputFormatter(
                                    mask: "###.###.###-##",
                                    filter: {"#": RegExp(r'[0-9]')})
                              ],
                              hintText: 'CPF',
                            ),
                            TextFieldLoginWidget(
                              keyboardType: TextInputType.emailAddress,
                              textFieldBloc: registerFormBloc.email,
                              hintText: 'E-mail',
                              autoFillHints: const [
                                AutofillHints.email,
                              ],
                            ),
                            TextFieldLoginWidget(
                              textFieldBloc: registerFormBloc.password,
                              hintText: 'Senha',
                              keyboardType: TextInputType.emailAddress,
                              suffixButton: SuffixButton.obscureText,
                              autoFillHints: const [
                                AutofillHints.password,
                              ],
                            ),
                            TextFieldLoginWidget(
                              textFieldBloc: registerFormBloc.passwordConfirm,
                              hintText: 'Confirme sua senha',
                              keyboardType: TextInputType.emailAddress,
                              suffixButton: SuffixButton.obscureText,
                              autoFillHints: const [
                                AutofillHints.password,
                              ],
                            ),
                            CheckboxFieldLoginWidget(
                              title: RichText(
                                text: TextSpan(
                                    text: 'Deseja receber ',
                                    style: AppTextStyles.h2.copyWith(
                                        fontSize: 14, color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'notificações por e-mail',
                                        style: AppTextStyles.h2HighlightBold
                                            .copyWith(
                                                fontSize: 14,
                                                color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: '?',
                                        style: AppTextStyles.h2.copyWith(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                    ]),
                              ),
                              booleanFieldBloc:
                                  registerFormBloc.emailNotifications,
                            ),
                            CheckboxFieldLoginWidget(
                              title: RichText(
                                text: TextSpan(
                                    text: 'Deseja receber ',
                                    style: AppTextStyles.h2.copyWith(
                                        fontSize: 14, color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'notificações pelo app',
                                        style: AppTextStyles.h2HighlightBold
                                            .copyWith(
                                                fontSize: 14,
                                                color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: '?',
                                        style: AppTextStyles.h2.copyWith(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                    ]),
                              ),
                              booleanFieldBloc:
                                  registerFormBloc.appNotifications,
                            ),
                            CheckboxFieldLoginWidget(
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
                                    'Li e aceito os Termos de Uso',
                                    style:
                                        AppTextStyles.h2HighlightBold.copyWith(
                                      fontSize: 14,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              booleanFieldBloc: registerFormBloc.acceptTerms,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () async {
                                  registerFormBloc.submit();
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
                                      'Entrar',
                                      style: AppTextStyles.h2HighlightBold
                                          .copyWith(
                                        color: AppColors.white,
                                        fontSize: 16,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  Modular.to.pushNamed('/login/');
                                },
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Já tem uma conta? ',
                                      style: AppTextStyles.h2.copyWith(
                                          fontSize: 16, color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Entrar',
                                            style: AppTextStyles.h2HighlightBold
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Modular.to.pushNamed('/login/');
                                              })
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
