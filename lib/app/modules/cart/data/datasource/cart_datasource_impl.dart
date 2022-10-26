import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';

import '../../infra/datasources/cart_datasource_interface.dart';

class CartDatasourceImpl implements CartDatasourceInterface {
  List<Map<String, dynamic>> listMock = [];

  @override
  Future<void> postCartDemand(List<CartItemModel> list) async {
    try {
      List<Map<String, dynamic>> mapList = [];
      for (int i = 0; i < list.length; i++) {
        mapList.add(list[i].toJson());
      }
      listMock = mapList;
    } catch (e) {
      throw Exception();
    }
  }
}
