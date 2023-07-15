abstract class IAuthStorage {
  Future<void> saveRefreshToken(String refreshToken);
  Future<void> saveAccessToken(String accessToken);
  Future<void> saveRole(String role);
  Future<void> saveIdToken(String idToken);
  Future<String> getRefreshToken();
  Future<String> getAccessToken();
  Future<String> getRole();
  Future<String> getIdToken();
  Future<void> cleanSecureStorage();
}
