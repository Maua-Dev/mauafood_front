import 'dart:developer';

class Failure implements Exception {
  final String message;

  Failure({required this.message}) {
    log('${DateTime.now()} - $message', name: 'Failure');
  }
}

class UserNotFound extends Failure {
  UserNotFound({required String message}) : super(message: message);
}
