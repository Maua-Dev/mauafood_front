import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/generated/l10n.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../bloc/register/bloc/register_bloc.dart';
import '../../bloc/resend-code/resend_code_form_bloc.dart';
import '../widgets/register_button_widget.dart';
import '../widgets/text_button_login_widget.dart';
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
          final resendCodeFormBloc =
              BlocProvider.of<ResendCodeFormBloc>(context);
          return BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error.message)));
              }
              if (state is RegisterLoadedState) {
                Modular.to.pushNamed('/login/confirm-email',
                    arguments: [registerBloc, resendCodeFormBloc.email.value]);
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
                          S.of(context).resendConfirmationCodeTitle,
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
                          textFieldBloc: resendCodeFormBloc.email,
                          title: S.of(context).emailTitle,
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        RegisterButtonWidget(
                          onPressed: () {
                            resendCodeFormBloc.submit();
                          },
                          title: S.of(context).sendTitle,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextButtonLoginWidget(
                          onPressed: () {
                            Modular.to.popUntil(ModalRoute.withName('/login'));
                          },
                          text: S.of(context).havePasswordTitle,
                          highlightText: S.of(context).doLoginTitle,
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
