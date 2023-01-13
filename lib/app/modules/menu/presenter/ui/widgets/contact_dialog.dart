import 'package:flutter/material.dart';
import 'package:mauafood_front/generated/l10n.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(S.of(context).typeContact),
                    content: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite aqui'),
                    ),
                    actions: <Widget>[
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
        },
        child: const Text('Contato'));
  }
}
