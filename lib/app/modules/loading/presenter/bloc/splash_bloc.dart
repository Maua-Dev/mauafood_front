import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<LoadingEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<LoadingEvent>(_onLoading);
  }

  FutureOr<void> _onLoading(
      LoadingEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(SplashSuccessState());
  }
}
