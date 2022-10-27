import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial()) {
    on<LoadingEvent>((event, emit) async {
      emit(Loading() as LoadingState);
      await Future.delayed(const Duration(seconds: 2));
      emit(LoadingSuccess());
    });
  }
}
