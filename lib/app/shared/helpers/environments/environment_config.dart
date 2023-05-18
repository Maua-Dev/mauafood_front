// ignore_for_file: constant_identifier_names

class EnvironmentConfig {
  static const MSS_PRODUCT = String.fromEnvironment('MSS_PRODUCT');
  static const S3_ASSETS_BASE_URL = String.fromEnvironment(
    'S3_ASSETS_BASE_URL',
  );
}
