import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import '../../../../shared/domain/errors/auth_errors.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final CognitoAuthSession authSession;

  const LoginSuccessState({required this.authSession});
}

class LoginErrorState extends LoginState {
  final AuthErrors error;

  const LoginErrorState(this.error);
}
