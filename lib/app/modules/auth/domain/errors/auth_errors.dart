class AuthErrors implements Exception {
  final String message;

  AuthErrors({required this.message});
}

class SignUpError extends AuthErrors {
  SignUpError({required super.message});
}

class RegisterError extends AuthErrors {
  RegisterError({required super.message});
}

class LogoutError extends AuthErrors {
  LogoutError({required super.message});
}

class ResetPasswordError extends AuthErrors {
  ResetPasswordError({required super.message});
}

class ConfirmationEmailError extends AuthErrors {
  final String email;
  ConfirmationEmailError({required this.email, required super.message});
}