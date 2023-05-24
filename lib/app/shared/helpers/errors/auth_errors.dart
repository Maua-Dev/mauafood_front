import 'dart:developer';

class AuthErrors implements Exception {
  final String message;

  AuthErrors({required this.message}) {
    log('${DateTime.now()} - $message', name: 'Failure');
  }
}
