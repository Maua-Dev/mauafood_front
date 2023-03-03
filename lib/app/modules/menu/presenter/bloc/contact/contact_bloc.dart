import 'dart:async';
import 'dart:convert';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:http/http.dart';
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

  Future sendEmail(
      {required String message,
      required String name,
      required String email}) async {
    const serviceId = 'service_vrsig67';
    const templateId = 'template_ng6wcpg';
    const userId = '3mu9l5O7WuZdcDbef';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'message': message,
        },
      }),
    );
    // ignore: avoid_print
    print(response.body);
  }

  @override
  Future<void> submit() async {
    if (email.value == '' || message.value == '' || name.value == '') {
      emitFailure(failureResponse: 'Preencha todos os campos');
    } else if (await email.validate() &&
        await name.validate() &&
        await message.validate()) {
      emitSuccess();
    } else {
      emitFailure(failureResponse: 'Erro ao enviar mensagem');
    }
  }

  @override
  Future<FutureOr<void>> onSubmitting() {
    return Future.delayed(const Duration(seconds: 1));
  }
}
