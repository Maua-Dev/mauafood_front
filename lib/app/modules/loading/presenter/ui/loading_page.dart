import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/loading/presenter/bloc/loading_bloc.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoadingBloc()..add(const LoadingEvent()),
        child: BlocBuilder<LoadingBloc, SplashState>(
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
