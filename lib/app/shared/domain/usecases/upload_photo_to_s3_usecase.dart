import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/repositories/menu_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class IUploadPhotoToS3Usecase {
  Future<Either<Failure, void>> call(String url, Uint8ClampedList photo);
}

class UploadPhotoToS3Usecase extends IUploadPhotoToS3Usecase {
  final IMenuRepository repository;

  UploadPhotoToS3Usecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(String url, Uint8ClampedList photo) async {
    var result = await repository.uploadPhotoToS3(url, photo);
    return result;
  }
}
