import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

class UserNotFound extends Failure {
  UserNotFound({required String message}) : super(message: message);
}
