import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashBloc()..add(const LoadingEvent()),
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            if (state is SplashLoadingState) {
              return Center(
                child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      'assets/images/mauafood_logo_marrom.png',
                    )),
              );
            }
            if (state is SplashSuccessState) {
              Modular.to.navigate('/restaurants/');
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
