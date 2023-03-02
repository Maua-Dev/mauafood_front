import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mauafood_front/app/modules/menu/presenter/bloc/contact/validation.dart';

import '../../../../../../generated/l10n.dart';

class ContactBloc extends FormBloc<String, String> with ValidationMixin {
  final message = TextFieldBloc();
  final email = TextFieldBloc();
  final name = TextFieldBloc();

  ContactBloc() {
    addFieldBlocs(
      fieldBlocs: [
        name,
        email,
        message,
      ],
    );
    email.addAsyncValidators([_validateEmail]);
    name.addAsyncValidators([_validateName]);
    message.addAsyncValidators([_validateMessage]);
  }

  Future<String?> _validateEmail(String? emailValue) async {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (emailValue!.isEmpty) {
      return 'Campo obrigatório';
    } else if (!regExp.hasMatch(emailValue)) {
      return S.current.invalidEmailAlert;
    }
    return null;
  }

  Future<String?> _validateName(String? nameValue) async {
    if (nameValue!.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  Future<String?> _validateMessage(String? messageValue) async {
    if (messageValue!.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @override
  Future<FutureOr<void>> onSubmitting() async {
    if (email.value == '' || message.value == '' || name.value == '') {
      emitFailure(failureResponse: 'Preencha todos os campos');
    } else if (await email.validate() &&
        await message.validate() &&
        await name.validate()) {
      emitSuccess();
    } else {
      emitFailure(failureResponse: 'Erro ao enviar mensagem');
    }
  }
}
