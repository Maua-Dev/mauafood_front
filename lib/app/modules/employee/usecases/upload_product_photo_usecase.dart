import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/repositories/menu_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class IUploadProductPhotoUsecase {
  Future<Either<Failure, String>> call(String id);
}

class UploadProductPhotoUsecase extends IUploadProductPhotoUsecase {
  final IMenuRepository repository;

  UploadProductPhotoUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(String id) async {
    var result = await repository.uploadProductPhoto(id);
    return result;
  }
}
