class AuthErrors implements Exception {
  final String message;

  AuthErrors({required this.message});
}

class SignInError extends AuthErrors {
  SignInError({required super.message});
}

class RegisterError extends AuthErrors {
  RegisterError({required super.message});
}
