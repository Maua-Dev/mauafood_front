import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ContactFormBloc extends FormBloc<String, String> {
  final message = TextFieldBloc();
  final email = TextFieldBloc();
  final name = TextFieldBloc();

  ContactFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        name,
        email,
        message,
      ],
    );
  }

  @override
  Future<void> submit() async {}

  @override
  FutureOr<void> onSubmitting() {}
}
