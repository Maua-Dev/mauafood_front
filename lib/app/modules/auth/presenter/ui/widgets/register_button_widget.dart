import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/register/bloc/register_bloc.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';

class RegisterButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const RegisterButtonWidget({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterLoadingState) {
              return CircularProgressIndicator(
                color: AppColors.white,
              );
            }
            return Text(
              title,
              style: AppTextStyles.h2HighlightBold.copyWith(
                color: AppColors.white,
                fontSize: 16,
              ),
            );
          },
        ),
      ),
    );
  }
}
