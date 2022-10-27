import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/utils/utils.dart';

class ErrorLoadingMenuWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorLoadingMenuWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: Utils.width(context),
          height: 300,
          child: Image.asset(
            'assets/images/mauafood_logo_cinza.png',
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
