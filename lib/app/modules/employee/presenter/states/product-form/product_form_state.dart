import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';

abstract class ProductFormState {
  const ProductFormState();
}

class ProductFormInitialState extends ProductFormState {}

class ProductFormLoadingState extends ProductFormState {}

class ProductFormSuccessState extends ProductFormState {
  final ProductModel product;

  const ProductFormSuccessState({required this.product});
}

class ProductFormFailureState extends ProductFormState {
  final Failure failure;

  const ProductFormFailureState({required this.failure});
}
