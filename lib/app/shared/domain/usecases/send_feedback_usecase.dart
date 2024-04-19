import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/repositories/feedback_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/feedback_model.dart';

abstract class ISendFeedbackUsecase {
  Future<Either<Failure, String>> call(FeedbackModel feedback);
}

class SendFeedbackUsecase extends ISendFeedbackUsecase {
  final IFeedbackRepository repository;

  SendFeedbackUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(FeedbackModel feedback) async {
    var result = await repository.sendRestaurantFeedback(feedback);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
