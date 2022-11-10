import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class AlertDialogCustomWidget extends StatelessWidget {
  final String title;
  final String confirmTitle;
  final String cancelTitle;
  final Function()? confirmOnPressed;
  final Function()? cancelOnPressed;
  const AlertDialogCustomWidget(
      {super.key,
      required this.title,
      required this.confirmTitle,
      required this.cancelTitle,
      this.confirmOnPressed,
      this.cancelOnPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyles.h2,
      ),
      actions: [
        ElevatedButton(
          onPressed: cancelOnPressed,
          child: Text(
            cancelTitle,
            style: AppTextStyles.h2,
          ),
        ),
        ElevatedButton(
          onPressed: confirmOnPressed,
          child: Text(
            confirmTitle,
            style: AppTextStyles.h2,
          ),
        ),
      ],
    );
  }
}
