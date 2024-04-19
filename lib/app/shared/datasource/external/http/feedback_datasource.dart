import 'package:mauafood_front/app/shared/helpers/services/http/http_request_interface.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/feedback_datasource_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/feedback_model.dart';

class FeedbackDatasource extends IFeedbackDatasource {
  final IHttpRequest _client;

  FeedbackDatasource(this._client);

  @override
  Future<String> sendRestaurantFeedback(FeedbackModel feedback) async {
    var data = feedback.toJson();
    final response = await _client.post(
      '/create-feedback',
      data: data,
    );
    if (response.statusCode != 201) {
      throw Exception('Não foi possível enviar o feedback');
    }
    return response.data["message"];
  }
}
