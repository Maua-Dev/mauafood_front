import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/widgets/contact/text_field_contact_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../../../bloc/contact/contact_form_bloc.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Modular.get<ContactFormBloc>(),
        child: AlertDialog(
          title: Text(S.of(context).typeContact),
          content: TextFieldContactWidget(
            textFieldBloc: Modular.get<ContactFormBloc>().message,
            title: 'Texto',
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Enviar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
