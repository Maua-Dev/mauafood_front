import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/splash/presenter/controllers/splash_controller.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _store = Modular.get<SplashController>();
    return Scaffold(
      backgroundColor: AppColors.mainBlueColor,
      body: Center(
        child: SizedBox(
            child: Image.network(
          splashGif,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
