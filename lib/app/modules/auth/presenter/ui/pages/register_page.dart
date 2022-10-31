import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/register/register_form_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => Modular.get<RegisterFormBloc>(),
            ),
          ],
          child: BlocProvider.value(
            value: authBloc,
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error.message)));
                }
                if (state is AuthLoadedState) {
                  Modular.to.navigate('/confirm-email', arguments: authBloc);
                }
              },
              child: Builder(
                builder: (context) {
                  final registerFormBloc =
                      BlocProvider.of<RegisterFormBloc>(context);
                  return FormBlocListener<RegisterFormBloc, String, String>(
                    onFailure: (context, state) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('É necessário aceitar as notificações.')));
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFieldBlocBuilder(
                            textFieldBloc: registerFormBloc.email,
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: const [
                              AutofillHints.email,
                            ],
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: registerFormBloc.emailConfirm,
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: const [
                              AutofillHints.email,
                            ],
                            decoration: const InputDecoration(
                              labelText: 'Confirme seu email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: registerFormBloc.password,
                            keyboardType: TextInputType.visiblePassword,
                            autofillHints: const [
                              AutofillHints.password,
                            ],
                            decoration: const InputDecoration(
                              labelText: 'Senha',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: registerFormBloc.passwordConfirm,
                            keyboardType: TextInputType.visiblePassword,
                            autofillHints: const [
                              AutofillHints.password,
                            ],
                            decoration: const InputDecoration(
                              labelText: 'Confirme sua senha',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: registerFormBloc.fullName,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: 'Nome Completo',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: registerFormBloc.cpf,
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              MaskTextInputFormatter(
                                  mask: "###.###.###-##",
                                  filter: {"#": RegExp(r'[0-9]')})
                            ],
                            decoration: const InputDecoration(
                              labelText: 'CPF',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: CheckboxFieldBlocBuilder(
                              booleanFieldBloc: registerFormBloc.isStudent,
                              body: Container(
                                alignment: Alignment.centerLeft,
                                child: const Text('É estudante?'),
                              ),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: registerFormBloc.raFake,
                            isEnabled: false,
                            decoration: const InputDecoration(
                              labelText: 'RA',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: registerFormBloc.ra,
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              MaskTextInputFormatter(
                                  mask: "##.#####-#",
                                  filter: {"#": RegExp(r'[0-9]')})
                            ],
                            decoration: const InputDecoration(
                              labelText: 'RA',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: CheckboxFieldBlocBuilder(
                              booleanFieldBloc: registerFormBloc.notifications,
                              body: Container(
                                alignment: Alignment.centerLeft,
                                child: const Text('Notificação'),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              registerFormBloc.submit();
                            },
                            child: const Text('Registrar'),
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
      ),
    );
  }
}
