import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class NewProductState {
  const NewProductState();
}

class NewProductInitialState extends NewProductState {}

class NewProductLoadingState extends NewProductState {}

class NewProductSuccessState extends NewProductState {}

class NewProductFailureState extends NewProductState {
  final Failure failure;

  const NewProductFailureState({required this.failure});
}
