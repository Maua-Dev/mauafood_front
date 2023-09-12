import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';

abstract class IContactRepository {
  Future<Either<Failure, Unit>> sendEmail(
      String name, String email, String message);
}
