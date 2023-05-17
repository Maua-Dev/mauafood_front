import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../controllers/login/login_controller.dart';
import '../../states/login_state.dart';

class LoginButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const LoginButtonWidget({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    var loginController = Modular.get<LoginController>();
    return Observer(builder: (_) {
      var state = loginController.state;
      return Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          child: state is LoginLoadingState
              ? CircularProgressIndicator(
                  color: AppColors.white,
                )
              : Text(
                  title,
                  style: AppTextStyles.h2HighlightBold.copyWith(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
        ),
      );
    });
  }
}
