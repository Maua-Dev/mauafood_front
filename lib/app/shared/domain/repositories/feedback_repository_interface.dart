import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/feedback_model.dart';

abstract class IFeedbackRepository {
  Future<Either<Failure, String>> sendRestaurantFeedback(
      FeedbackModel feedback);
}
