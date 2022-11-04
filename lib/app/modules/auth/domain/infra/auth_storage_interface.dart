abstract class AuthStorageInterface {
  Future<void> saveRefreshToken(String refreshToken);
  Future<void> saveAccessToken(String accessToken);
  Future<String?> getRefreshToken();
  Future<String?> getAccessToken();
  Future<void> cleanSecureStorage();
}
