import 'dart:async';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/logout_user.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/forgot_password.dart';
import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/confirm_reset_password.dart';
import '../../../domain/usecases/login_user.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserInterface login;
  final LogoutUserInterface logout;
  final ForgotPasswordInterface forgotPassword;
  final ConfirmResetPasswordInterface confirmResetPassword;
  final AuthStorageInterface storage;
  late Either<AuthErrors, CognitoAuthSession> eitherIsLogged;
  bool _loggedIn = false;

  bool get isLoggedIn => _loggedIn;

  AuthBloc({
    required this.forgotPassword,
    required this.confirmResetPassword,
    required this.logout,
    required this.storage,
    required this.login,
  }) : super(AuthInitialState()) {
    on<LoginWithEmail>(_loginWithEmail);
    on<LogoutUser>(_logoutUser);
    on<ForgotPassword>(_forgotPassword);
    on<ConfirmResetPassword>(_confirmResetPassword);
  }

  FutureOr<void> _loginWithEmail(
      LoginWithEmail event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    eitherIsLogged = await login(event.email, event.password);
    emit(eitherIsLogged.fold((failure) {
      return AuthErrorState(failure);
    }, (authSession) {
      _loggedIn = true;
      storage.saveAccessToken(authSession.userPoolTokens!.accessToken);
      storage.saveRefreshToken(authSession.userPoolTokens!.refreshToken);
      return const AuthLoadedState(isLogged: true);
    }));
  }

  Future<void> verifyIfHaveTokens() async {
    try {
      var refreshToken = await storage.getRefreshToken();
      var accessToken = await storage.getAccessToken();
      if (refreshToken!.isNotEmpty && accessToken!.isNotEmpty) {
        _loggedIn = true;
      } else {
        _loggedIn = false;
        Modular.to.navigate('/login/');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  FutureOr<void> _logoutUser(LogoutUser event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    var result = await logout();
    emit(result.fold((failure) {
      return AuthErrorState(failure);
    }, (isConfirmed) {
      return const AuthLoadedState(isLogged: false);
    }));
    if (state is AuthLoadedState) {
      await storage.cleanSecureStorage();
      Modular.to.popUntil(ModalRoute.withName('/login'));
    }
  }

  FutureOr<void> _forgotPassword(
      ForgotPassword event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    var result = await forgotPassword(event.email);
    emit(result.fold((failure) {
      return AuthErrorState(failure);
    }, (isConfirmed) {
      if (isConfirmed) {
        return AuthLoadedState(isLogged: _loggedIn);
      } else {
        return AuthErrorState(
            ForgotPasswordError(message: 'Resete de senha não autorizado.'));
      }
    }));
  }

  FutureOr<void> _confirmResetPassword(
      ConfirmResetPassword event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    var result = await confirmResetPassword(
        event.email, event.newPassword, event.confirmationCode);
    emit(result.fold((failure) {
      return AuthErrorState(failure);
    }, (isConfirmed) {
      return AuthLoadedState(isLogged: _loggedIn);
    }));
    if (state is AuthLoadedState) {
      Modular.to.popUntil(ModalRoute.withName('/login'));
    }
  }
}
