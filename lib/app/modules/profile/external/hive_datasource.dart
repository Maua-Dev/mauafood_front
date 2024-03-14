import 'package:hive_flutter/hive_flutter.dart';

import '../infra/datasource/favorite_datasource.dart';

class FavoritesHiveDatasource implements FavoriteDatasource {
  final String _boxName = 'favorites';
  FavoritesHiveDatasource();

  @override
  Future<void> addFavorite(String id) async {
    final box = Hive.box<String>(_boxName);
    await box.add(id);
  }

  @override
  Future<List<String>> getFavorites() async {
    final box = Hive.box<String>(_boxName);

    return box.values.toList();
  }

  @override
  Future<void> removeFavorite(String id) async {
    final box = Hive.box<String>(_boxName);
    await box.delete(box.values.toList().indexOf(id));
  }
}
