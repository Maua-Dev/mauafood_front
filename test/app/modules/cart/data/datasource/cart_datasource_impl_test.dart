import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/cart/cart_module.dart';
import 'package:mauafood_front/app/modules/cart/data/datasource/cart_datasource_impl.dart';
import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  initModules([AppModule(), CartModule()]);
  late CartDatasourceImpl datasource;
  var itemMock = const CartItemModel(
      meal: MealModel(
        photo: '',
        id: 10,
        name: 'name',
        description: 'description',
        price: 10,
        type: MealEnum.bebida,
      ),
      quantity: 10,
      id: '123');
  List<CartItemModel> listMock = [itemMock];

  setUp(() {
    datasource = CartDatasourceImpl();
  });

  test('[TEST] - postCartDemand returns void', () async {
    var map = itemMock.toJson();
    await datasource.postCartDemand(listMock);
    expect(datasource.listMock, [map]);
  });
}
