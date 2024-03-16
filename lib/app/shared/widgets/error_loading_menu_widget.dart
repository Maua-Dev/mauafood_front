import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

import '../helpers/services/s3/assets_s3.dart';

class ErrorLoadingMenuWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorLoadingMenuWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                greyLogo,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              errorMessage,
              style: AppTextStyles.h2,
            ),
          ],
        ),
      ),
    );
  }
}
