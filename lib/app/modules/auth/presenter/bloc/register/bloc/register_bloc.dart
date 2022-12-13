import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/errors/auth_errors.dart';
import '../../../../domain/usecases/confirm_email.dart';
import '../../../../domain/usecases/register_user.dart';
import '../../../../domain/usecases/resend_confirmation_code.dart';
import '../../../../infra/models/user_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUserInterface register;
  final ConfirmEmailInterface confirmEmail;
  final ResendConfirmationCodeInterface resendConfirmationCode;
  late Either<AuthErrors, bool> eitherIsRegistered;
  late Either<AuthErrors, bool> eitherIsConfirmed;
  RegisterBloc(
      {required this.resendConfirmationCode,
      required this.register,
      required this.confirmEmail})
      : super(RegisterInitialState()) {
    on<RegisterUser>(_registerUser);
    on<ConfirmEmail>(_confirmEmail);
    on<ResendConfirmationCode>(_resendConfirmationCode);
  }

  FutureOr<void> _registerUser(
      RegisterUser event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    var user = UserModel(
      fullName: event.fullName,
      cpf: event.cpf,
      email: event.email,
      password: event.password,
      appNotifications: event.appNotifications,
      emailNotifications: event.emailNotifications,
      acceptTerms: event.acceptTerms,
      role: 'USER',
    );
    eitherIsRegistered = await register(user);
    emit(eitherIsRegistered.fold((failure) {
      return RegisterErrorState(error: failure);
    }, (isRegistered) {
      return const RegisterLoadedState();
    }));
  }

  FutureOr<void> _confirmEmail(
      ConfirmEmail event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    eitherIsConfirmed = await confirmEmail(event.email, event.code);
    emit(eitherIsConfirmed.fold((failure) {
      return RegisterErrorState(error: failure);
    }, (isConfirmed) {
      return ConfirmLoadedState(isConfirmed: isConfirmed);
    }));
  }

  FutureOr<void> _resendConfirmationCode(
      ResendConfirmationCode event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    var result = await resendConfirmationCode(event.email);
    emit(result.fold((failure) {
      return RegisterErrorState(error: failure);
    }, (isConfirmed) {
      return const RegisterLoadedState();
    }));
  }
}
