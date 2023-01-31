import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class ErrorLoadingMenuWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorLoadingMenuWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Image.asset(
            'assets/images/logos/grey_logo.png',
            fit: BoxFit.contain,
          ),
        ),
        Text(
          errorMessage,
          style: AppTextStyles.h2,
        ),
      ],
    );
  }
}
