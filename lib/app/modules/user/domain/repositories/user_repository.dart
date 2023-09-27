import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, User>> createUser();
  Future<Either<Failure, User>> updatePhoto(User data);
  Future<Either<Failure, bool>> isFirstUse();
}
