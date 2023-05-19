// ignore_for_file: constant_identifier_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/infra/repositories/menu_repository.dart';

import '../../../modules/menu/user_menu_module.dart';
import '../../domain/repositories/menu_repository_interface.dart';
import '../../infra/datasource/external/http/menu_datasource_interface.dart';

class EnvironmentConfig {
  static const MSS_PRODUCT = String.fromEnvironment('MSS_PRODUCT');
  static const S3_ASSETS_BASE_URL = String.fromEnvironment(
    'S3_ASSETS_BASE_URL',
  );
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static Future<IMenuRepository> getUserRepo() async {
    await Modular.isModuleReady<UserMenuModule>();
    // EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
    //   (element) {
    //     return element.name.toUpperCase() == ENV.toUpperCase();
    //   },
    //   orElse: () => EnvironmentEnum.DEV,
    // );
    // if (value == EnvironmentEnum.DEV) {
    return Future.value(
        MenuRepository(datasource: Modular.get<IMenuDatasource>()));
    // } else if (value == EnvironmentEnum.HOMOLOG) {
    //   return UserRepositoryHttp(
    //       datasource: Modular.get<IUserDatasource>(),
    //       storage: Modular.get<UserLocalStorage>());
    // }
    // else if (value == EnvironmentEnum.PROD) {
    //   return null;
    // else {
    //   return UserRepositoryMock();
    // }
  }
}
