import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/user/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/user/domain/repositories/user_repository.dart';

abstract class CheckFirstUse {
  Future<Either<Failure, bool>> call();
}

class CheckFirstUseImpl implements CheckFirstUse {
  final UserRepository _repository;

  CheckFirstUseImpl(this._repository);

  @override
  Future<Either<Failure, bool>> call() async {
    return await _repository.isFirstUse();
  }
}
