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
import '../../../../../shared/infra/user_roles_enum.dart';
import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/confirm_reset_password.dart';
import '../../../domain/usecases/get_user_attributes.dart';
import '../../../domain/usecases/login_user.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserInterface login;
  final LogoutUserInterface logout;
  final ForgotPasswordInterface forgotPassword;
  final ConfirmResetPasswordInterface confirmResetPassword;
  final AuthStorageInterface storage;
  final GetUserAttributesInterface getUserAttributes;
  late Either<AuthErrors, CognitoAuthSession> eitherIsLogged;
  bool _loggedIn = false;
  UserRolesEnum? _userRole;

  bool get isLoggedIn => _loggedIn;
  UserRolesEnum? get userRole => _userRole;

  AuthBloc({
    required this.getUserAttributes,
    required this.forgotPassword,
    required this.confirmResetPassword,
    required this.logout,
    required this.storage,
    required this.login,
  }) : super(AuthInitialState()) {
    on<LoginWithEmail>(_loginWithEmail);
    on<LogoutUser>(_logoutUser);
    on<ForgotPassword>(_forgotPassword);
    on<ChangePassword>(_changePassword);
  }

  FutureOr<void> _loginWithEmail(
      LoginWithEmail event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    eitherIsLogged = await login(event.email, event.password);
    var userAttributes = await getUserAttributes();
    userAttributes.fold((failure) => emit(AuthErrorState(failure)),
        (attributes) {
      var role = attributes
          .firstWhere(
              (element) => element.userAttributeKey.toString() == 'custom:role')
          .value;
      _userRole = UserRolesEnumExtension.stringToEnumMap(role);
      storage.saveRole(role);
    });
    emit(eitherIsLogged.fold((failure) {
      return AuthErrorState(failure);
    }, (authSession) {
      _loggedIn = true;
      storage.saveAccessToken(authSession.userPoolTokens!.accessToken);
      storage.saveRefreshToken(authSession.userPoolTokens!.refreshToken);
      return AuthLoadedState(
          isLogged: _loggedIn, userRole: userRole ?? UserRolesEnum.user);
    }));
  }

  Future<void> verifyIfHaveTokens() async {
    try {
      var refreshToken = await storage.getRefreshToken();
      var accessToken = await storage.getAccessToken();
      var role = await storage.getRole();
      if (refreshToken!.isNotEmpty &&
          accessToken!.isNotEmpty &&
          role!.isNotEmpty) {
        _loggedIn = true;
        _userRole = UserRolesEnumExtension.stringToEnumMap(role);
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
      return AuthLoadedState(
          isLogged: false, userRole: userRole ?? UserRolesEnum.user);
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
    }, (isReseted) {
      return AuthConfirmResetState(isReseted: isReseted);
    }));
  }

  FutureOr<void> _changePassword(
      ChangePassword event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    var result = await confirmResetPassword(
        event.email, event.newPassword, event.confirmationCode);
    emit(result.fold((failure) {
      return AuthErrorState(failure);
    }, (isConfirmed) {
      return const AuthChangePasswordCompleteState();
    }));
  }
}
