import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/cart/domain/infra/cart_repository_interface.dart';
import 'package:mauafood_front/app/modules/cart/domain/usecases/post_cart_demand.dart';
import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_car_demand_test.mocks.dart';

@GenerateMocks([CartRepositoryInterface])
void main() {
  late PostCartDemandInterface useCase;
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
  CartRepositoryInterface repository = MockCartRepositoryInterface();

  setUp(() {
    useCase = PostCartDemandImpl(repository: repository);
  });

  group('[TEST] - PostCartDemandImpl call', () {
    test('returns success (bool true)', () async {
      when(repository.postCartDemand(listMock)).thenAnswer(
        (realInvocation) async => const Right(true),
      );
      var result = await useCase(listMock);
      expect(result.fold(id, id), isA<bool>());
      expect(result.fold(id, id), true);
    });

    test('returns Failure', () async {
      when(repository.postCartDemand(listMock)).thenAnswer(
        (realInvocation) async => Left(Failure(message: '')),
      );
      var result = await useCase(listMock);
      expect(result.fold(id, id), isA<Failure>());
    });
  });
}
