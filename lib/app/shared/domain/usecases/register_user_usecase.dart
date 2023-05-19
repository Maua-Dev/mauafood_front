import 'package:dartz/dartz.dart';
import '../../infra/models/user_model.dart';
import '../errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class IRegisterUserUsecase {
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

class RegisterUserUsecase extends IRegisterUserUsecase {
  final AuthRepositoryInterface repository;

  RegisterUserUsecase({required this.repository});

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
