abstract class IContactDatasource {
  Future<void> sendEmail(String name, String email, String message);
}
