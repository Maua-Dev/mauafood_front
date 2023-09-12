import 'package:mauafood_front/app/shared/helpers/services/http/http_request_interface.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/contact_datasource_interface.dart';

class ContactDatasource extends IContactDatasource {
  final IHttpRequest _client;

  ContactDatasource(this._client);
  @override
  Future<void> sendEmail(String name, String email, String message) async {
    final response = await _client.post(
      '/public/contact-us',
      data: {
        'name': name,
        'email': email,
        'message': message,
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Erro ao enviar email');
    }
  }
}
