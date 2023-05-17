import 'package:mobx/mobx.dart';
import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/register_user.dart';
import '../../ui/states/register_state.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final AuthStorageInterface storage;
  final RegisterUserInterface register;

  RegisterControllerBase(this.storage, this.register);

  @observable
  RegisterState state = RegisterInitialState();

  @action
  void changeState(RegisterState value) => state = value;

  @action
  Future<void> registerUser() async {
    changeState(RegisterLoadingState());
    var result = await register(fullName, cpf, isStudent, email, password,
        emailNotification, appNotification, acceptTerms);
    changeState(result.fold((failure) {
      return RegisterErrorState(error: failure);
    }, (user) {
      return const RegisterSuccessState();
    }));
  }

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  String confirmPassword = '';

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @observable
  String fullName = '';

  @action
  void setFullName(String value) => fullName = value;

  @observable
  String cpf = '';

  @action
  void setCpf(String value) => cpf = value;

  @observable
  bool isStudent = false;

  @action
  void setIsStudent(bool value) => isStudent = value;

  @observable
  bool emailNotification = false;

  @action
  void setEmailNotification(bool value) => emailNotification = value;

  @observable
  bool appNotification = false;

  @action
  void setAppNotification(bool value) => appNotification = value;

  @observable
  bool acceptTerms = false;

  @action
  void setAcceptTerms(bool value) => acceptTerms = value;
}
