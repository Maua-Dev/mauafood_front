import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import '../repositories/contact_repository_interface.dart';

abstract class IContactUsecase {
  Future<Either<Failure, void>> call(String name, String email, String message);
}

class ContactUsecase extends IContactUsecase {
  final IContactRepository repository;

  ContactUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(
      String name, String email, String message) async {
    var result = await repository.sendEmail(name, email, message);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
