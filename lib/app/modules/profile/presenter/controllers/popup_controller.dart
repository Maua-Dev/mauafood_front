import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/usecases/send_feedback_usecase.dart';
import 'package:mauafood_front/app/shared/infra/models/feedback_model.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mobx/mobx.dart';

part 'popup_controller.g.dart';

class PopupStore = PopupStoreBase with _$PopupStore;

abstract class PopupStoreBase with Store {
  final SendFeedbackUsecase _sendFeedback;

  PopupStoreBase(this._sendFeedback);
  @observable
  bool showPopup = true;
  bool evaluated = true;
  RestaurantEnum restaurantName = RestaurantEnum.none;

  @action
  setRestaurantName(RestaurantEnum restaurant) {
    if (restaurant != RestaurantEnum.none) {
      restaurantName = restaurant;
    }
  }

  @action
  void togglePopup() {
    showPopup = !showPopup;
  }

  @action
  void openPopUp() {
    showPopup = showPopup;
  }

  @action
  void evaluatedPopUp() {
    evaluated = !evaluated;
  }

  @observable
  int grade = 0;

  @action
  Future<void> sendFeedback(
      String id, RestaurantEnum restaurantName, BuildContext context) async {
    FeedbackModel feedback = FeedbackModel.newInstance();

    feedback = feedback.copyWith(
        value: grade, orderId: id, restaurant: restaurantName);

    var result = await _sendFeedback(feedback);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.mainBlueColor,
        content: Text("Não foi possivel realizar a avaliação",
            style: AppTextStyles.h2.copyWith(color: AppColors.white)),
      ));
    }, (r) => togglePopup());
  }

  @action
  void setStars(int value) {
    grade = value;
    autorun((_) {});

    // ignore: unused_element
    int getStars() {
      return grade;
    }
  }
}
