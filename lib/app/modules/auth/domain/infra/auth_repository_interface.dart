import 'package:dartz/dartz.dart';
import '../../infra/models/user_model.dart';
import '../errors/auth_errors.dart';

abstract class AuthRepositoryInterface {
  Future<Either<RegisterError, bool>> registerUser(UserModel user);
  Future<Either<SignInError, bool>> loginUser(String email, String password);
}
