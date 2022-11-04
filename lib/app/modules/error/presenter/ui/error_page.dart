import 'package:flutter/material.dart';

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
        SizedBox(height: MediaQuery.of(context).size.height / 3),
        ErrorLoadingMenuWidget(errorMessage: errorMessage),
      ],
    ));
  }
}
