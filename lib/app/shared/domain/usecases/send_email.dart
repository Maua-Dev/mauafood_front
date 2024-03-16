import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import '../repositories/contact_repository_interface.dart';

abstract class ISendEmail {
  Future<Either<Failure, void>> call(String name, String email, String message);
}

class SendEmail extends ISendEmail {
  final IContactRepository repository;

  SendEmail(this.repository);

  @override
  Future<Either<Failure, void>> call(
      String name, String email, String message) async {
    return await repository.sendEmail(name, email, message);
  }
}
