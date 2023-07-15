import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/contact_repository_interface.dart';
import '../../helpers/enums/http_status_code_enum.dart';
import '../../helpers/errors/errors.dart';
import '../../helpers/functions/get_http_status_function.dart';
import '../datasource/external/http/contact_datasource_interface.dart';

class ContactRepository extends IContactRepository {
  final IContactDatasource datasource;

  ContactRepository({required this.datasource});

  @override
  Future<Either<Failure, void>> sendEmail(
      String name, String email, String message) async {
    try {
      await datasource.sendEmail(name, email, message);
      return const Right(null);
    } on ContactError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.statusCode ?? HttpStatus.badRequest);
      return Left(ErrorRequest(message: errorType.errorMessage));
    }
  }
}
