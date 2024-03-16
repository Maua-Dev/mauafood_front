// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesController on FavoritesControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'FavoritesControllerBase.state', context: context);

  @override
  FavoriteState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(FavoriteState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$productsFavoritesAtom =
      Atom(name: 'FavoritesControllerBase.productsFavorites', context: context);

  @override
  List<FavoriteViewModel> get productsFavorites {
    _$productsFavoritesAtom.reportRead();
    return super.productsFavorites;
  }

  @override
  set productsFavorites(List<FavoriteViewModel> value) {
    _$productsFavoritesAtom.reportWrite(value, super.productsFavorites, () {
      super.productsFavorites = value;
    });
  }

  late final _$removeFavoriteAsyncAction =
      AsyncAction('FavoritesControllerBase.removeFavorite', context: context);

  @override
  Future<bool> removeFavorite(FavoriteViewModel item) {
    return _$removeFavoriteAsyncAction.run(() => super.removeFavorite(item));
  }

  late final _$FavoritesControllerBaseActionController =
      ActionController(name: 'FavoritesControllerBase', context: context);

  @override
  void setState(FavoriteState value) {
    final _$actionInfo = _$FavoritesControllerBaseActionController.startAction(
        name: 'FavoritesControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$FavoritesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
productsFavorites: ${productsFavorites}
    ''';
  }
}
