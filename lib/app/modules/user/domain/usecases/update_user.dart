import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/user/domain/entities/user.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/modules/user/domain/repositories/user_repository.dart';

abstract class UpdatePhoto {
  Future<Either<Failure, User>> call(User data);
}

class UpdatePhotoImpl implements UpdatePhoto {
  final UserRepository _repository;

  UpdatePhotoImpl(this._repository);

  @override
  Future<Either<Failure, User>> call(User data) async {
    return await _repository.updatePhoto(data);
  }
}
