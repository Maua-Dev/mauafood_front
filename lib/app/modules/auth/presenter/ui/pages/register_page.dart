import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/register/bloc/register_bloc.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../bloc/register/register_form_bloc.dart';
import '../widgets/checkbox_field_login_widget.dart';
import '../widgets/register_button_widget.dart';
import '../widgets/text_button_login_widget.dart';
import '../widgets/text_field_login_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterBloc registerBloc;

  @override
  void initState() {
    super.initState();
    registerBloc = Modular.get<RegisterBloc>();
  }

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
            BlocProvider(
              create: (context) => registerBloc,
            ),
          ],
          child: Builder(builder: (context) {
            final registerFormBloc = BlocProvider.of<RegisterFormBloc>(context);
            return BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error.message)));
                }
                if (state is RegisterLoadedState) {
                  Modular.to.pushNamed('/login/confirm-email',
                      arguments: [registerBloc, registerFormBloc.email.value]);
                }
              },
              child: FormBlocListener<RegisterFormBloc, String, String>(
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
                          S.of(context).registerTitle,
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
                          hintText: S.of(context).fullNameTitle,
                        ),
                        TextFieldLoginWidget(
                          keyboardType: TextInputType.number,
                          textFieldBloc: registerFormBloc.cpf,
                          inputFormatters: [
                            MaskTextInputFormatter(
                                mask: "###.###.###-##",
                                filter: {"#": RegExp(r'[0-9]')})
                          ],
                          hintText: S.of(context).cpfTitle,
                        ),
                        TextFieldLoginWidget(
                          keyboardType: TextInputType.emailAddress,
                          textFieldBloc: registerFormBloc.email,
                          hintText: S.of(context).emailTitle,
                          autoFillHints: const [
                            AutofillHints.email,
                          ],
                        ),
                        TextFieldLoginWidget(
                          textFieldBloc: registerFormBloc.password,
                          hintText: S.of(context).passwordTitle,
                          keyboardType: TextInputType.emailAddress,
                          suffixButton: SuffixButton.obscureText,
                          autoFillHints: const [
                            AutofillHints.password,
                          ],
                        ),
                        TextFieldLoginWidget(
                          textFieldBloc: registerFormBloc.passwordConfirm,
                          hintText: S.of(context).confirmPasswordTitle,
                          keyboardType: TextInputType.emailAddress,
                          suffixButton: SuffixButton.obscureText,
                          autoFillHints: const [
                            AutofillHints.password,
                          ],
                        ),
                        CheckboxFieldLoginWidget(
                          title: RichText(
                            text: TextSpan(
                                text: S
                                    .of(context)
                                    .notificationsOptionsSchema('normalPart'),
                                style: AppTextStyles.h2.copyWith(
                                    fontSize: 14, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: S
                                        .of(context)
                                        .notificationsOptionsSchema('email'),
                                    style: AppTextStyles.h2HighlightBold
                                        .copyWith(
                                            fontSize: 14, color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: S.of(context).questionMark,
                                    style: AppTextStyles.h2.copyWith(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ]),
                          ),
                          booleanFieldBloc: registerFormBloc.emailNotifications,
                        ),
                        CheckboxFieldLoginWidget(
                          title: RichText(
                            text: TextSpan(
                                text: S
                                    .of(context)
                                    .notificationsOptionsSchema('normalPart'),
                                style: AppTextStyles.h2.copyWith(
                                    fontSize: 14, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: S
                                        .of(context)
                                        .notificationsOptionsSchema('app'),
                                    style: AppTextStyles.h2HighlightBold
                                        .copyWith(
                                            fontSize: 14, color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: S.of(context).questionMark,
                                    style: AppTextStyles.h2.copyWith(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ]),
                          ),
                          booleanFieldBloc: registerFormBloc.appNotifications,
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
                                S.of(context).appAcceptTerms,
                                style: AppTextStyles.h2HighlightBold.copyWith(
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
                        RegisterButtonWidget(
                          onPressed: () {
                            registerFormBloc.submit();
                          },
                          title: S.of(context).registerTitle,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextButtonLoginWidget(
                          onPressed: () {
                            Modular.to.popUntil(ModalRoute.withName('/login'));
                          },
                          text: S.of(context).haveAccountTitle,
                          highlightText: S.of(context).enterTitle,
                        ),
                      ],
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
