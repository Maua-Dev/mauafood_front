import 'package:mauafood_front/app/modules/user/presenter/controllers/user_controller.dart';

import 'package:mauafood_front/app/shared/domain/usecases/send_email.dart';
import 'package:mauafood_front/app/shared/domain/usecases/user_send_email.dart';

import 'package:mobx/mobx.dart';

import '../../../../generated/l10n.dart';
import '../../helpers/utils/validation_helper.dart';
import '../../../modules/user/presenter/states/contact/contact_state.dart';

part 'contact_controller.g.dart';

class ContactController = ContactControllerBase with _$ContactController;

abstract class ContactControllerBase with Store {
  final ISendEmail _sendEmail;
  final IUserSendEmail _userSendEmail;
  final UserController _userController;
  ContactControllerBase(
    this._sendEmail,
    this._userSendEmail,
    this._userController,
  );

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
  String? validateName(String? value) =>
      isLogged ? null : ValidationHelper.validateName(value);

  @action
  String? validateEmail(String? value) =>
      isLogged ? null : ValidationHelper.validateEmail(value);

  @action
  String? validateMessage(String? value) =>
      value?.isEmpty ?? false ? S.current.requiredFieldAlert : null;

  @computed
  bool get isLogged => _userController.isLogged;

  @action
  Future<void> sendEmail() async {
    changeState(ContactLoadingState());
    final result = isLogged
        ? await _userSendEmail(message)
        : await _sendEmail(name, email, message);

    changeState(result.fold((l) {
      return ContactErrorState(failure: l);
    }, (list) {
      return ContactSuccessState();
    }));
  }
}
