import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/splash/presenter/bloc/splash_bloc.dart';

void main() {
  late SplashBloc bloc;

  setUp(() {
    bloc = SplashBloc();
  });

  blocTest(
    '[BLOC STATE] - Returns succesfull state',
    build: () => bloc,
    act: (bloc) {
      bloc.add(const LoadingEvent());
    },
    wait: const Duration(seconds: 2),
    expect: () => [SplashLoadingState(), SplashSuccessState()],
  );
}
