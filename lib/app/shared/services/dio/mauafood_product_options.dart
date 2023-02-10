import 'package:dio/dio.dart';
import 'package:mauafood_front/app/shared/services/environments/environment_config.dart';

final mauafoodProductBaseOptions = BaseOptions(
  baseUrl: EnvironmentConfig.MSS_PRODUCT,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
