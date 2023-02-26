import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../../../../../../shared/themes/app_text_styles.dart';

class InformationDialog extends StatelessWidget {
  const InformationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Armazenamento de dados',
            style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold)),
        content: Text(
            'Caso voce confirme o envio da mensagem, está concordando que armazenemos seu nome e e-mail para que possamos ter o seu feedback e caso necessário, responde-lo.',
            style: AppTextStyles.h2),
        actions: [
          TextButton(
            onPressed: () => Modular.to.pop(),
            child: Text('Fechar', style: AppTextStyles.h2Highlight),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
