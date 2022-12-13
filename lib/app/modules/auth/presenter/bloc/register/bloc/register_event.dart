part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends RegisterEvent {
  final String email;
  final String password;
  final String cpf;
  final String fullName;
  final bool appNotifications;
  final bool emailNotifications;
  final bool acceptTerms;
  final String role;

  const RegisterUser({
    required this.role,
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
        role,
      ];
}

class ConfirmEmail extends RegisterEvent {
  final String email;
  final String code;

  const ConfirmEmail({required this.email, required this.code});

  @override
  List<Object> get props => [email, code];
}

class ResendConfirmationCode extends RegisterEvent {
  final String email;
  const ResendConfirmationCode({required this.email});

  @override
  List<Object> get props => [];
}
