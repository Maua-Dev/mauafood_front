import 'package:auth_package/core/auth_store.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../infra/datasource/favorite_datasource.dart';

class FavoritesHiveDatasource implements FavoriteDatasource {
  final AuthStore _authStore;
  final String _boxName = 'favorites';
  FavoritesHiveDatasource(this._authStore);

  @override
  Future<void> addFavorite(String id) async {
    final box = Hive.box(_boxName);
    final listFav =
        await box.get(_authStore.user!.username, defaultValue: <String>[]);
    listFav.add(id);
    await box.put(_authStore.user!.username, listFav);
  }

  @override
  Future<List<String>> getFavorites() async {
    final box = Hive.box(_boxName);
    return await box.get(_authStore.user!.username, defaultValue: <String>[]);
  }

  @override
  Future<void> removeFavorite(String id) async {
    final box = Hive.box(_boxName);
    final listFav =
        await box.get(_authStore.user!.username, defaultValue: <String>[]);
    listFav.remove(id);
    await box.put(_authStore.user!.username, listFav);
  }
}
