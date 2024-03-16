import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class ConfirmationDialogWidget extends StatelessWidget {
  final String? dialogTitle;
  final String dialogContent;
  final String confirmationText;
  final Function()? onConfirmation;
  final String? cancellationText;
  final Function()? onCancellation;
  const ConfirmationDialogWidget({
    Key? key,
    this.dialogTitle,
    required this.dialogContent,
    required this.confirmationText,
    this.onConfirmation,
    this.cancellationText,
    this.onCancellation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: dialogTitle != null
            ? Text(dialogTitle!,
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold))
            : null,
        content: Text(dialogContent, style: AppTextStyles.h2),
        actions: [
          if (cancellationText != null)
            TextButton(
                onPressed: () {
                  onCancellation ?? Modular.to.pop();
                },
                child:
                    Text(cancellationText!, style: AppTextStyles.h2Highlight)),
          TextButton(
              onPressed: onConfirmation ?? Modular.to.pop,
              child: Text(confirmationText, style: AppTextStyles.h2Highlight)),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
