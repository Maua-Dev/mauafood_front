import 'package:auth_package/core/auth_store.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../profile/infra/datasource/favorite_datasource.dart';

class HiveDatasource implements FavoriteDatasource {
  final AuthStore _authStore;
  final Box box;

  HiveDatasource._(this.box, this._authStore);

  static Future<HiveDatasource> instance(AuthStore authStore) async {
    await Hive.initFlutter();
    var box = await Hive.openBox('favorites');
    return HiveDatasource._(box, authStore);
  }

  @override
  Future<void> addFavorite(String id) async {
    final listFav =
        await box.get(_authStore.user!.username, defaultValue: <String>[]);
    listFav.add(id);
    await box.put(_authStore.user!.username, listFav);
  }

  @override
  Future<List<String>> getFavorites() async {
    return await box.get(_authStore.user!.username, defaultValue: <String>[]);
  }

  @override
  Future<void> removeFavorite(String id) async {
    final listFav =
        await box.get(_authStore.user!.username, defaultValue: <String>[]);
    listFav.remove(id);
    await box.put(_authStore.user!.username, listFav);
  }
}
