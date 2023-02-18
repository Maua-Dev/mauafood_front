import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/widgets/contact/text_field_contact_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:http/http.dart';

import '../../../../../../../shared/themes/app_colors.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';
import '../../../../bloc/contact/contact_form_bloc.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({super.key});

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
  }

  void showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 150.0,
      content: Text(message),
      backgroundColor: AppColors.mainBlueColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<ContactFormBloc>(),
      child: Builder(builder: (context) {
        final contactFormBloc = BlocProvider.of<ContactFormBloc>(context);
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor2,
          actionsPadding: const EdgeInsets.only(bottom: 16),
          title: Text(S.of(context).typeContact,
              style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold)),
          content: Scrollable(
            viewportBuilder: (BuildContext context, ViewportOffset position) =>
                Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldContactWidget(
                  textFieldBloc: contactFormBloc.name,
                  title: S.of(context).labelName,
                  hintText: S.of(context).labelName,
                  keyboardType: TextInputType.multiline,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(500),
                  ],
                ),
                TextFieldContactWidget(
                  textFieldBloc: contactFormBloc.email,
                  title: S.of(context).labelEmail,
                  hintText: S.of(context).labelEmail,
                  keyboardType: TextInputType.multiline,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(500),
                  ],
                ),
                TextFieldContactWidget(
                  textFieldBloc: contactFormBloc.message,
                  title: S.of(context).labelMessage,
                  hintText: S.of(context).labelMessage,
                  keyboardType: TextInputType.multiline,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(500),
                  ],
                ),
              ],
            ),
          ),
          scrollable: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(200, 60)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.mainBlueColor),
                ),
                child: Text(
                  S.of(context).labelSend.toUpperCase(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  sendEmail(
                      message: contactFormBloc.message.value,
                      name: contactFormBloc.name.value,
                      email: contactFormBloc.email.value);

                  showSnackBar(context, 'Email enviado com sucesso!');
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
