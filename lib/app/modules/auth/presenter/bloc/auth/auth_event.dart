part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginWithEmail extends AuthEvent {
  final String email;
  final String password;

  const LoginWithEmail({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class RegisterUser extends AuthEvent {
  final String email;
  final String password;
  final String cpf;
  final String fullName;
  final bool appNotifications;
  final bool emailNotifications;
  final bool acceptTerms;
  final bool isStudent;

  const RegisterUser({
    required this.isStudent,
    required this.appNotifications,
    required this.emailNotifications,
    required this.acceptTerms,
    required this.email,
    required this.password,
    required this.cpf,
    required this.fullName,
  });

  @override
  List<Object> get props => [
        email,
        password,
        cpf,
        fullName,
        appNotifications,
        emailNotifications,
        acceptTerms,
        isStudent,
      ];
}

class LogoutUser extends AuthEvent {
  const LogoutUser();
}

class ConfirmEmail extends AuthEvent {
  final String email;
  final String code;

  const ConfirmEmail({required this.email, required this.code});

  @override
  List<Object> get props => [email, code];
}

class ResetPassword extends AuthEvent {
  final String email;
  const ResetPassword({required this.email});

  @override
  List<Object> get props => [email];
}

class ConfirmResetPassword extends AuthEvent {
  final String email;
  final String newPassword;
  final String confirmationCode;
  const ConfirmResetPassword(
      {required this.newPassword,
      required this.confirmationCode,
      required this.email});

  @override
  List<Object> get props => [email, newPassword, confirmationCode];
}
