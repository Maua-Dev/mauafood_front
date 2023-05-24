import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';

import '../../helpers/errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class IGetUserAttributesUsecase {
  Future<Either<AuthErrors, List<AuthUserAttribute>>> call();
}

class GetUserAttributesUsecase extends IGetUserAttributesUsecase {
  final IAuthRepository repository;

  GetUserAttributesUsecase({required this.repository});

  @override
  Future<Either<AuthErrors, List<AuthUserAttribute>>> call() async {
    var result = await repository.getUserAttributes();
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
