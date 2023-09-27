import 'package:mauafood_front/app/modules/user/presenter/models/product_viewmodel.dart';

import '../../../../shared/helpers/errors/errors.dart';

abstract class UserMenuState {
  const UserMenuState();
}

class UserMenuInitialState extends UserMenuState {}

class UserMenuLoadingState extends UserMenuState {}

class UserMenuLoadedSuccessState extends UserMenuState {
  final List<ProductViewModel> listProduct;
  final int index;

  const UserMenuLoadedSuccessState(
      {required this.index, required this.listProduct});
}

class UserMenuErrorState extends UserMenuState {
  final Failure failure;

  const UserMenuErrorState({required this.failure});
}
