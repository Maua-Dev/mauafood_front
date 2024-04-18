import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/app/shared/domain/entities/feedback.dart';

class FeedbackModel extends Feedback {
  FeedbackModel({
    required super.orderId,
    required super.restaurant,
    required super.value,
  });

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "restaurant": EnumToString.convertToString(restaurant).toUpperCase(),
        "value": value,
      };
}
