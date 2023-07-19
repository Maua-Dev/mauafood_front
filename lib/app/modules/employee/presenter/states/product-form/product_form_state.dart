import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class ProductFormState {
  const ProductFormState();
}

class ProductFormInitialState extends ProductFormState {}

class ProductFormLoadingState extends ProductFormState {}

class ProductFormSuccessState extends ProductFormState {}

class ProductFormFailureState extends ProductFormState {
  final Failure failure;

  const ProductFormFailureState({required this.failure});
}
