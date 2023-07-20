import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../controllers/splash_controller.dart';
import '../../states/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<SplashController>();
    return Scaffold(
      backgroundColor: AppColors.mainBlueColor,
      body: Observer(builder: (_) {
        if (controller.state is SplashLoadingState) {
          return Center(
            child: SizedBox(
                child: Image.network(
              splashGif,
              fit: BoxFit.cover,
            )),
          );
        }
        if (controller.state is SplashSuccessState) {
          Modular.to.pushNamed('/employee/',
              arguments: RestaurantEnum.cantina_do_moleza);
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
