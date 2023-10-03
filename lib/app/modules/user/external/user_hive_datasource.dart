import 'package:hive_flutter/hive_flutter.dart';
import 'package:mauafood_front/app/modules/user/infra/datasources/user_hive_datasource.dart';

class UserHiveDatasourceImpl implements UserHiveDatasource {
  final String _boxName = 'user';

  @override
  Future<bool> checkIsFirstUse() async {
    final box = Hive.box(_boxName);
    final isFirstUse = box.get('isFirstUse', defaultValue: true);
    if (isFirstUse) {
      await box.put('isFirstUse', false);
    }
    return isFirstUse;
  }
}
