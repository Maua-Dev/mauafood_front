import 'package:mauafood_front/app/modules/menu/presenter/states/contact/contact_state.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/utils/validation_utils.dart';

part 'contact_controller.g.dart';

class ContactController = ContactControllerBase with _$ContactController;

abstract class ContactControllerBase with Store {
  @observable
  ContactState state = ContactInitialState();

  @action
  void changeState(ContactState value) => state = value;

  @observable
  String message = '';

  @observable
  String email = '';

  @observable
  String name = '';

  @action
  void setMessage(String value) => message = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setName(String value) => name = value;

  @action
  String? validateName(String? value) {
    return ValidationHelper.validateName(value);
  }

  @action
  String? validateEmail(String? value) {
    return ValidationHelper.validateEmail(value);
  }

  @action
  String? validateMessage(String? value) {
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    }
    return null;
  }

  @action
  Future<void> sendEmail() async {
    changeState(ContactLoadingState());
    const serviceId = 'service_vrsig67';
    const templateId = 'template_ng6wcpg';
    const userId = '3mu9l5O7WuZdcDbef';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    // CRIAR USE CASE
    // final response = await post(
    //   url,
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: jsonEncode({
    //     'service_id': serviceId,
    //     'template_id': templateId,
    //     'user_id': userId,
    //     'template_params': {
    //       'user_name': name,
    //       'user_email': email,
    //       'message': message,
    //     },
    //   }),
    // );
  }
}
