import 'package:dartz/dartz.dart';

import 'package:mauafood_front/app/modules/user/domain/entities/user.dart';

import 'package:mauafood_front/app/modules/user/infra/datasources/user_hive_datasource.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/user_datasource.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _datasource;
  final UserHiveDatasource _hiveDatasource;
  UserRepositoryImpl(this._datasource, this._hiveDatasource);

  @override
  Future<Either<Failure, User>> createUser() async {
    try {
      final user = await _datasource.createUser();
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final user = await _datasource.getUser();
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, User>> updatePhoto(User data) async {
    try {
      final user = await _datasource
          .updateUser(UserModel.fromUser(data).toUpdatePhoto());
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> isFirstUse() async {
    try {
      final isFirstUse = await _hiveDatasource.checkIsFirstUse();
      return Right(isFirstUse);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
