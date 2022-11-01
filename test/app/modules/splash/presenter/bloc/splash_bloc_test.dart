import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/splash/presenter/bloc/splash_bloc.dart';
import 'package:mockito/mockito.dart';

void main() {
  late SplashBloc bloc;

  setUp(() {
    bloc = SplashBloc();
  });

  blocTest(
    'returns succesfull state',
    build: () => bloc,
    act: (bloc) async {
      bloc.add(const LoadingEvent());
    },
    expect: () => [SplashLoadingState(), SplashSuccessState()],
  );
}
