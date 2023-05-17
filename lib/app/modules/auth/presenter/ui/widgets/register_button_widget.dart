import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/register/register_controller.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../states/register_state.dart';

class RegisterButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const RegisterButtonWidget({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    final registerController = Modular.get<RegisterController>();
    return Observer(builder: (_) {
      var state = registerController.state;
      return Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          child: state is RegisterLoadingState
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
