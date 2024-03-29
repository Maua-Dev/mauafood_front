import 'package:dio/dio.dart';
import 'package:mauafood_front/app/shared/helpers/environments/environment_config.dart';

final productBaseOptions = BaseOptions(
  baseUrl: EnvironmentConfig.MSS_PRODUCT,
  connectTimeout: 30000,
  receiveTimeout: 30000,
);
