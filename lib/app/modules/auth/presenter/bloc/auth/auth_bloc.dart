import 'dart:async';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/logout_user.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/forgot_password.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/confirm_email.dart';
import '../../../domain/usecases/confirm_reset_password.dart';
import '../../../domain/usecases/login_user.dart';
import '../../../domain/usecases/register_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserInterface login;
  final RegisterUserInterface register;
  final ConfirmEmailInterface confirmEmail;
  final LogoutUserInterface logout;
  final ForgotPasswordInterface forgotPassword;
  final ConfirmResetPasswordInterface confirmResetPassword;
  final AuthStorageInterface storage;
  late Either<AuthErrors, CognitoAuthSession> eitherIsLogged;
  late Either<AuthErrors, bool> eitherIsRegistered;
  late Either<AuthErrors, bool> eitherIsConfirmed;
  String email = '';
  bool _loggedIn = false;

  bool get isLoggedIn => _loggedIn;

  AuthBloc(
      {required this.forgotPassword,
      required this.confirmResetPassword,
      required this.logout,
      required this.storage,
      required this.confirmEmail,
      required this.login,
      required this.register})
      : super(AuthInitialState()) {
    on<RegisterUser>(_registerUser);
    on<LoginWithEmail>(_loginWithEmail);
    on<ConfirmEmail>(_confirmEmail);
    on<LogoutUser>(_logoutUser);
    on<ForgotPassword>(_forgotPassword);
    on<ConfirmResetPassword>(_confirmResetPassword);
  }

  FutureOr<void> _registerUser(
      RegisterUser event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    var user = UserModel(
      id: const Uuid().v4(),
      fullName: event.fullName,
      cpf: event.cpf,
      isStudent: false,
      email: event.email,
      password: event.password,
      appNotifications: event.appNotifications,
      emailNotifications: event.emailNotifications,
      acceptTerms: event.acceptTerms,
    );
    eitherIsRegistered = await register(user);
    emit(eitherIsRegistered.fold((failure) {
      return AuthErrorState(failure);
    }, (isRegistered) {
      return AuthLoadedState(isLogged: isRegistered);
    }));
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

  FutureOr<void> _confirmEmail(
      ConfirmEmail event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    eitherIsConfirmed = await confirmEmail(event.email, event.code);
    emit(eitherIsConfirmed.fold((failure) {
      return AuthErrorState(failure);
    }, (isConfirmed) {
      return AuthLoadedState(isLogged: isConfirmed);
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
      Modular.to.navigate('/login/');
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
      Modular.to.navigate('/login/');
    }
  }
}
