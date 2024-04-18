import 'package:mauafood_front/app/shared/infra/models/feedback_model.dart';

abstract class IFeedbackDatasource {
  Future<String> sendRestaurantFeedback(FeedbackModel feedback);
}
