import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/usecases/confirm_email.dart';
import '../../../domain/usecases/login_user.dart';
import '../../../domain/usecases/register_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserInterface login;
  final RegisterUserInterface register;
  final ConfirmEmailInterface confirmEmail;
  late Either<AuthErrors, bool> eitherIsLogged;
  late Either<AuthErrors, bool> eitherIsRegistered;
  late Either<AuthErrors, bool> eitherIsConfirmed;
  late String email;

  AuthBloc(
      {required this.confirmEmail, required this.login, required this.register})
      : super(AuthInitialState()) {
    on<RegisterUser>(_registerUser);
    on<LoginWithEmail>(_loginWithEmail);
    on<ConfirmEmail>(_confirmEmail);
  }

  FutureOr<void> _registerUser(
      RegisterUser event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    var user = UserModel(
      id: const Uuid().v4(),
      fullName: event.fullName,
      cpf: event.cpf,
      isStudent: event.isStudent,
      email: event.email,
      password: event.password,
      notifications: event.notifications,
    );
    eitherIsRegistered = await register(user);
    emit(eitherIsRegistered.fold((failure) {
      return AuthErrorState(failure);
    }, (isLogged) {
      email = event.email;
      return AuthLoadedState(isLogged: isLogged);
    }));
  }

  FutureOr<void> _loginWithEmail(
      LoginWithEmail event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    eitherIsLogged = await login(event.email, event.password);
    emit(eitherIsLogged.fold((failure) {
      return AuthErrorState(failure);
    }, (isLogged) {
      return AuthLoadedState(isLogged: isLogged);
    }));
  }

  FutureOr<void> _confirmEmail(
      ConfirmEmail event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    eitherIsConfirmed = await confirmEmail(event.email, event.code);
    emit(eitherIsConfirmed.fold((failure) {
      return AuthErrorState(failure);
    }, (isLogged) {
      return AuthLoadedState(isLogged: isLogged);
    }));
  }
}
