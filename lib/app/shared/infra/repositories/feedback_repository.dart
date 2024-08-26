import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mauafood_front/app/shared/domain/repositories/feedback_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/enums/http_status_code_enum.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/helpers/functions/get_http_status_function.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/feedback_datasource_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/feedback_model.dart';

class FeedbackRespository implements IFeedbackRepository {
  final IFeedbackDatasource datasource;

  FeedbackRespository({required this.datasource});

  @override
  Future<Either<Failure, String>> sendRestaurantFeedback(
      FeedbackModel feedback) async {
    try {
      var response = await datasource.sendRestaurantFeedback(feedback);
      return right(response);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }
}
