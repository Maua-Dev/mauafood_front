import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../bloc/auth/auth_bloc.dart';

class AuthButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const AuthButtonWidget({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoadingState) {
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
