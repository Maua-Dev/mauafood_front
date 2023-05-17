import 'package:dartz/dartz.dart';
import '../../infra/models/user_model.dart';
import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class RegisterUserInterface {
  Future<Either<RegisterError, bool>> call(
    String fullName,
    String cpf,
    bool isStudent,
    String email,
    String password,
    bool emailNotifications,
    bool appNotifications,
    bool acceptTerms,
  );
}

class RegisterUserImpl extends RegisterUserInterface {
  final AuthRepositoryInterface repository;

  RegisterUserImpl({required this.repository});

  @override
  Future<Either<RegisterError, bool>> call(
    String fullName,
    String cpf,
    bool isStudent,
    String email,
    String password,
    bool emailNotifications,
    bool appNotifications,
    bool acceptTerms,
  ) async {
    var user = UserModel(
      fullName: fullName,
      cpf: cpf,
      isStudent: isStudent,
      email: email,
      password: password,
      emailNotifications: emailNotifications,
      appNotifications: appNotifications,
      acceptTerms: acceptTerms,
    );
    var result = await repository.registerUser(user);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
