abstract class IContactDatasource {
  Future<void> sendEmail(String name, String email, String message);
  Future<void> sendEmailOnlyMessage(String message);
}
