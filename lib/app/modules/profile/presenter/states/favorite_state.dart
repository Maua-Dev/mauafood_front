import 'package:mauafood_front/app/modules/profile/presenter/ui/models/favorite_viewmodel.dart';

abstract class FavoriteState {
  const FavoriteState();
}

class LoadingFavoriteState implements FavoriteState {
  const LoadingFavoriteState();
}

class SuccessFavoriteState implements FavoriteState {
  final List<FavoriteViewModel> products;
  const SuccessFavoriteState(this.products);
}

class ErrorFavoriteState implements FavoriteState {
  final String message;
  const ErrorFavoriteState(this.message);
}
