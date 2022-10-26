import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';

import '../../infra/datasources/cart_datasource_interface.dart';

class CartDatasourceImpl implements CartDatasourceInterface {
  List<Map<String, dynamic>> listMock = [];

  @override
  Future<void> postCartDemand(List<CartItemModel> list) async {
    try {
      List<Map<String, dynamic>> mapList = list.map((e) {
        e.toJson();
      }).toList() as List<Map<String, dynamic>>;
      listMock = mapList;
    } catch (e) {
      throw Exception();
    }
  }
}
