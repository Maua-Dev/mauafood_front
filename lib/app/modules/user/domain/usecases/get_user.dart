import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/user/domain/errors/errors.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

abstract class GetUser {
  Future<Either<Failure, User>> call();
}

class GetUserImpl implements GetUser {
  final UserRepository _repository;

  GetUserImpl(this._repository);
  @override
  Future<Either<Failure, User>> call() async {
    final user = await _repository.getUser();
    if (user.isLeft() && user.fold((l) => l is UserNotFound, (r) => false)) {
      final newUser = await _repository.createUser();
      return newUser;
    }

    return user;
  }
}
