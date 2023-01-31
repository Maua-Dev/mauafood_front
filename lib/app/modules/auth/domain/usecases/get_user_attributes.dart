import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class GetUserAttributesInterface {
  Future<Either<GetUserAttributesError, List<AuthUserAttribute>>> call();
}

class GetUserAttributesImpl extends GetUserAttributesInterface {
  final AuthRepositoryInterface repository;

  GetUserAttributesImpl({required this.repository});

  @override
  Future<Either<GetUserAttributesError, List<AuthUserAttribute>>> call() async {
    var result = await repository.getUserAttributes();
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
