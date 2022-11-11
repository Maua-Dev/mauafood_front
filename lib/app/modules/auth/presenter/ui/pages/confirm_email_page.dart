import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/register/bloc/register_bloc.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../bloc/confirm-email/confirm_email_bloc.dart';
import '../widgets/register_button_widget.dart';
import '../widgets/text_field_login_widget.dart';

class ConfirmEmailPage extends StatelessWidget {
  final RegisterBloc registerBloc;
  const ConfirmEmailPage({super.key, required this.registerBloc});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => Modular.get<ConfirmEmailBloc>(),
            ),
          ],
          child: BlocProvider.value(
            value: registerBloc,
            child: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is ConfirmLoadedState) {
                  Modular.to.pushNamed('/login/success-confirm');
                }
              },
              child: Builder(
                builder: (context) {
                  final confirmEmailFormBloc =
                      BlocProvider.of<ConfirmEmailBloc>(context);
                  return FormBlocListener<ConfirmEmailBloc, String, String>(
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 64),
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
                              'Confirme seu e-mail',
                              style: AppTextStyles.h2HighlightBold.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              'Para completar seu cadastro enviamos um e-mail com um código, insira-o no campo abaixo.',
                              style: AppTextStyles.h2
                                  .copyWith(color: Colors.black, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextFieldLoginWidget(
                              keyboardType: TextInputType.number,
                              textFieldBloc: confirmEmailFormBloc.code,
                              title: 'Código',
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            RegisterButtonWidget(
                              onPressed: () {
                                confirmEmailFormBloc.submit();
                              },
                              title: 'Confirmar',
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
