import 'package:dio/dio.dart';
import 'package:mauafood_front/app/modules/menu/infra/datasources/menu_datasource_interface.dart';

import '../../../../shared/helpers/services/dio/mauafood_product_options.dart';

class MenuDatasourceImpl implements MenuDatasourceInterface {
  Dio dio = Dio();

  MenuDatasourceImpl() {
    dio = Dio(mauafoodProductBaseOptions);
  }

  @override
  Future<Map<String, dynamic>> getAllProducts() async {
    try {
      var response = await dio.get('/get-all-products-group-by-restaurant');
      if (response.statusCode == 200) {
        return response.data;
      }
      throw Exception();
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
      rethrow;
    }
  }
}
