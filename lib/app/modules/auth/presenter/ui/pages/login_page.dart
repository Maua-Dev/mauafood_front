import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/login/login_bloc.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../widgets/text_field_login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthBloc authBloc;

  @override
  void initState() {
    super.initState();
    authBloc = Modular.get<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor2,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => Modular.get<LoginBloc>(),
            ),
            BlocProvider(
              create: (context) => authBloc,
            ),
          ],
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error.message)));
              }

              if (state is AuthLoadedState) {
                Modular.to.pushNamed('/restaurants');
              }
            },
            child: Builder(
              builder: (context) {
                final confirmEmailFormBloc =
                    BlocProvider.of<LoginBloc>(context);
                return FormBlocListener<LoginBloc, String, String>(
                  onFailure: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.failureResponse!)));
                  },
                  child: SingleChildScrollView(
                    child: Column(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
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
                                  'Login',
                                  style: AppTextStyles.h2HighlightBold.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFieldLoginWidget(
                                  textFieldBloc: confirmEmailFormBloc.email,
                                  title: 'E-mail',
                                ),
                                TextFieldLoginWidget(
                                  textFieldBloc: confirmEmailFormBloc.password,
                                  title: 'Senha',
                                  keyboardType: TextInputType.visiblePassword,
                                  suffixButton: SuffixButton.obscureText,
                                  autoFillHints: const [
                                    AutofillHints.password,
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      confirmEmailFormBloc.submit();
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
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Modular.to.pushNamed('/login/forgot-password',
                                arguments: authBloc);
                          },
                          child: Text(
                            'Esqueceu a senha?',
                            style: AppTextStyles.h2HighlightBold
                                .copyWith(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextButton(
                            onPressed: () async {
                              Modular.to.pushNamed('/login/register',
                                  arguments: authBloc);
                            },
                            child: Text('Cadastre-se',
                                style: AppTextStyles.h2HighlightBold.copyWith(
                                    fontSize: 16, color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
