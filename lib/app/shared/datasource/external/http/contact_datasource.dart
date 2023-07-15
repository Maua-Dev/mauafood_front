import 'dart:convert';

import 'package:http/http.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/contact_datasource_interface.dart';

import '../../../helpers/errors/errors.dart';

class ContactDatasource extends IContactDatasource {
  @override
  Future<void> sendEmail(String name, String email, String message) async {
    const serviceId = 'service_vrsig67';
    const templateId = 'template_ng6wcpg';
    const userId = '3mu9l5O7WuZdcDbef';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'message': message,
        },
      }),
    );

    if (response.statusCode != 200) {
      throw ContactError(
        response.statusCode,
      );
    }
  }
}
