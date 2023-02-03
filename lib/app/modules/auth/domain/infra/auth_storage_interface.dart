abstract class AuthStorageInterface {
  Future<void> saveRefreshToken(String refreshToken);
  Future<void> saveAccessToken(String accessToken);
  Future<void> saveRole(String role);
  Future<String?> getRefreshToken();
  Future<String?> getAccessToken();
  Future<String?> getRole();
  Future<void> cleanSecureStorage();
}
