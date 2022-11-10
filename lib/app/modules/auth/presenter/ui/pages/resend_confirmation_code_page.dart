import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../bloc/register/bloc/register_bloc.dart';
import '../../bloc/resend-code/resend_code_form_bloc.dart';
import '../widgets/text_field_login_widget.dart';

class ResendConfirmationCodePage extends StatefulWidget {
  const ResendConfirmationCodePage({super.key});

  @override
  State<ResendConfirmationCodePage> createState() =>
      _ResendConfirmationCodePageState();
}

class _ResendConfirmationCodePageState
    extends State<ResendConfirmationCodePage> {
  late RegisterBloc registerBloc;

  @override
  void initState() {
    super.initState();
    registerBloc = Modular.get<RegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Modular.get<ResendCodeFormBloc>(),
          ),
          BlocProvider(
            create: (context) => registerBloc,
          ),
        ],
        child: Builder(builder: (context) {
          final forgotPasswordFormBloc =
              BlocProvider.of<ResendCodeFormBloc>(context);
          return BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoadedState) {
                Modular.to.pushNamed('/login/confirm-email', arguments: [
                  registerBloc,
                  forgotPasswordFormBloc.email.value
                ]);
              }
            },
            child: FormBlocListener<ResendCodeFormBloc, String, String>(
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
                          'Reeviar código de confirmação',
                          style: AppTextStyles.h2HighlightBold.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          'Por favor, digite seu e-mail, vamos mandar um código de verificação.',
                          style: AppTextStyles.h2
                              .copyWith(color: Colors.black, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFieldLoginWidget(
                          textFieldBloc: forgotPasswordFormBloc.email,
                          title: 'E-mail',
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () async {
                              forgotPasswordFormBloc.submit();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                            ),
                            child: BlocBuilder<RegisterBloc, RegisterState>(
                              builder: (context, state) {
                                if (state is RegisterLoadingState) {
                                  return CircularProgressIndicator(
                                    color: AppColors.white,
                                  );
                                }
                                return Text(
                                  'Enviar',
                                  style: AppTextStyles.h2HighlightBold.copyWith(
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
                              Modular.to
                                  .popUntil(ModalRoute.withName('/login'));
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: 'Já tem uma senha? ',
                                  style: AppTextStyles.h2.copyWith(
                                      fontSize: 16, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Faça o login',
                                      style: AppTextStyles.h2HighlightBold
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
