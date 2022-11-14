import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/cart/cart_module.dart';
import 'package:mauafood_front/app/modules/cart/domain/infra/cart_repository_interface.dart';
import 'package:mauafood_front/app/modules/cart/infra/datasources/cart_datasource_interface.dart';
import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';
import 'package:mauafood_front/app/modules/cart/infra/repository/cart_repository_impl.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'cart_repository_impl_test.mocks.dart';

@GenerateMocks([CartDatasourceInterface])
void main() {
  initModules([AppModule(), CartModule()]);

  CartDatasourceInterface datasource = MockCartDatasourceInterface();
  late CartRepositoryInterface repository;
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
    repository = CartRepositoryImpl(datasource: datasource);
  });

  group('[TEST] - postCartDemand', () {
    test('returns success bool true', () async {
      when(datasource.postCartDemand(listMock))
          .thenAnswer((realInvocation) async => listMock);
      var result = await repository.postCartDemand(listMock);
      expect(result.fold(id, id), true);
    });

    test('returns failure', () async {
      when(datasource.postCartDemand(listMock)).thenThrow(Exception());
      var result = await repository.postCartDemand(listMock);
      expect(result.fold(id, id), isA<Failure>());
    });
  });
}
