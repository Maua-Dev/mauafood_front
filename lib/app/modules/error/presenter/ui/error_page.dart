import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../../../shared/modules/error/error_loading_menu_widget.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;
  const ErrorPage({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ErrorLoadingMenuWidget(errorMessage: errorMessage)),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 18,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.buttonsColor)),
              onPressed: () => Modular.to.navigate(
                    '/',
                  ),
              child: const Text(
                "Home",
              )),
        )
      ],
    ));
  }
}
