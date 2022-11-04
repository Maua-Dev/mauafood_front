part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashSuccessState extends SplashState {}
