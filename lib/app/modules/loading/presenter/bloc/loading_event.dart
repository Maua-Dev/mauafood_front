part of 'loading_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class LoadingEvent extends SplashEvent {
  const LoadingEvent();
}
