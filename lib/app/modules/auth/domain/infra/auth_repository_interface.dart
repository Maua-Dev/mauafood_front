import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/auth/domain/entities/user_entity.dart';

import '../../../menu/domain/errors/errors.dart';

abstract class AuthRepositoryInterface {
  Future<Either<Failure, bool>> registerUser(User user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
}
