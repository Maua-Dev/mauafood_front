import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/confirm-email/confirm_email_bloc.dart';

class ConfirmEmailPage extends StatelessWidget {
  const ConfirmEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Modular.get<AuthBloc>(),
          ),
          BlocProvider(
            create: (context) => Modular.get<ConfirmEmailBloc>(),
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
                  BlocProvider.of<ConfirmEmailBloc>(context);
              return FormBlocListener<ConfirmEmailBloc, String, String>(
                onFailure: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ocorreu algum erro.')));
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFieldBlocBuilder(
                        textFieldBloc: confirmEmailFormBloc.code,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [
                          AutofillHints.email,
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
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
    );
  }
}
