abstract class AuthStorageInterface {
  Future<void> saveId(String id);
  Future<void> saveFullName(String fullName);
  Future<String?> getId();
  Future<String?> getFullName();
  Future<void> cleanSecureStorage();
}
