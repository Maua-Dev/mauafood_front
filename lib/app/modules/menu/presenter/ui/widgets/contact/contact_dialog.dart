import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/widgets/contact/text_field_contact_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../bloc/contact/contact_form_bloc.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<ContactFormBloc>(),
      child: Builder(builder: (context) {
        final contactFormBloc = BlocProvider.of<ContactFormBloc>(context);
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor2,
          title: Text(S.of(context).typeContact,
              style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold)),
          content: TextFieldContactWidget(
            textFieldBloc: contactFormBloc.message,
            title: S.of(context).labelTextField,
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
                      MaterialStateProperty.all<Color>(AppColors.buttonsColor),
                ),
                child: Text(
                  S.of(context).labelButton,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
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
