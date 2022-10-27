import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, SplashState> {
  LoadingBloc() : super(SplashInitialState()) {
    on<LoadingEvent>(_onLoading);
  }

  FutureOr<void> _onLoading(
      LoadingEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(SplashSuccessState());
  }
}
