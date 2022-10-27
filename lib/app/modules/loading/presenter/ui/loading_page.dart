import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 250,
            height: 250,
            child: Image.asset(
              'assets/images/mauafood_logo_marrom.png',
            )),
      ),
    );
  }
}
