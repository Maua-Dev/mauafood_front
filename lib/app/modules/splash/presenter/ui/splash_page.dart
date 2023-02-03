import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/auth/auth_bloc.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../../../shared/infra/user_roles_enum.dart';
import '../bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlueColor,
      body: BlocProvider(
        create: (context) => SplashBloc()..add(const LoadingEvent()),
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            if (state is SplashLoadingState) {
              return Center(
                child: SizedBox(
                    child: Image.asset(
                  'assets/images/logos/mauafood_logo_black.gif',
                  fit: BoxFit.cover,
                )),
              );
            }
            if (state is SplashSuccessState) {
              Modular.to.navigate('/user/');
              return const CircularProgressIndicator();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
