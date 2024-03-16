import '../../../../../shared/helpers/errors/errors.dart';

abstract class ContactState {
  const ContactState();
}

class ContactInitialState extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactSuccessState extends ContactState {}

class ContactErrorState extends ContactState {
  final Failure failure;

  const ContactErrorState({required this.failure});
}
