import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/app/shared/domain/entities/feedback.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

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

  FeedbackModel copyWith(
      {String? orderId, RestaurantEnum? restaurant, int? value}) {
    return FeedbackModel(
      orderId: orderId ?? this.orderId,
      restaurant: restaurant ?? this.restaurant,
      value: value ?? this.value,
    );
  }

  factory FeedbackModel.newInstance() {
    return FeedbackModel(
      orderId: '',
      restaurant: RestaurantEnum.cantina_do_moleza,
      value: 0,
    );
  }
}
