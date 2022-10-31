import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/login/login_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';

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
                Modular.to.navigate('/restaurants');
              }
            },
            child: Builder(
              builder: (context) {
                final confirmEmailFormBloc =
                    BlocProvider.of<LoginBloc>(context);
                return FormBlocListener<LoginBloc, String, String>(
                  onFailure: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ocorreu algum erro.')));
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFieldBlocBuilder(
                          textFieldBloc: confirmEmailFormBloc.email,
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
                          textFieldBloc: confirmEmailFormBloc.password,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [
                            AutofillHints.email,
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            Modular.to
                                .pushNamed('/register', arguments: authBloc);
                          },
                          child: const Text('Registrar'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            confirmEmailFormBloc.submit();
                          },
                          child: const Text('Confirmar'),
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
