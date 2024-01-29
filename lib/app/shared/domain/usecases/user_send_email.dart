import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import '../repositories/contact_repository_interface.dart';

abstract class IUserSendEmail {
  Future<Either<Failure, void>> call(String message);
}

class UserSendEmail extends IUserSendEmail {
  final IContactRepository repository;

  UserSendEmail(this.repository);

  @override
  Future<Either<Failure, void>> call(String message) async {
    return await repository.sendEmailOnlyMessage(message);
  }
}
