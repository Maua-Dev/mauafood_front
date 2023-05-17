import '../../../../domain/errors/errors.dart';

abstract class ContactState {
  const ContactState();
}

class ContactInitialState extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactLoadedSuccessState extends ContactState {}

class ContactErrorState extends ContactState {
  final Failure failure;

  const ContactErrorState({required this.failure});
}
