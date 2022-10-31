import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/confirm_email.dart';
import '../../../domain/usecases/login_user.dart';
import '../../../domain/usecases/register_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserInterface login;
  final RegisterUserInterface register;
  final ConfirmEmailInterface confirmEmail;
  // final AuthStorageInterface storage;
  late Either<AuthErrors, bool> eitherIsLogged;
  late Either<AuthErrors, bool> eitherIsRegistered;
  late Either<AuthErrors, bool> eitherIsConfirmed;
  String email = '';
  bool _loggedIn = false;
  String _id = '';
  String _fullName = '';

  bool get isLoggedIn => _loggedIn;
  String get id => _id;
  String get fullName => _fullName;

  AuthBloc(
      {
      // required this.storage,
      required this.confirmEmail,
      required this.login,
      required this.register})
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
    }, (isLogged) {
      _loggedIn = isLogged;

      return AuthLoadedState(isLogged: isLogged);
    }));
    // if (_loggedIn) {
    //   await storage.saveId(_id);
    //   await storage.saveFullName(_fullName);
    // }
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

  // Future<void> verifyIfHaveTokens() async {
  //   try {
  //     var id = await storage.getId();
  //     var fullName = await storage.getFullName();
  //     if (id!.isNotEmpty && fullName!.isNotEmpty) {
  //       _loggedIn = true;
  //     } else {
  //       _loggedIn = false;
  //       Modular.to.navigate('/login');
  //     }
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e);
  //   }
  // }
}
