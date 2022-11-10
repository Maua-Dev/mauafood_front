import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/cart/cart_module.dart';
import 'package:mauafood_front/app/modules/cart/domain/usecases/post_cart_demand.dart';
import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';
import 'package:mauafood_front/app/modules/cart/presenter/bloc/cart_bloc.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';

@GenerateMocks([PostCartDemandInterface])
void main() {
  initModules([AppModule(), CartModule()]);

  late CartBloc bloc;
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
  );
  List<CartItemModel> listMock = [itemMock];

  setUp(() {
    bloc = CartBloc();
  });

  group('[TEST] - LoadCartEvent', () {
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        bloc.add(const LoadCartEvent());
      },
      expect: () => [
        const CartLoadedState(cartItems: []),
      ],
    );
  });

  group('[TEST] - AddItemEvent', () {
    blocTest(
      'adds an item after LoadCart',
      build: () => bloc,
      act: (bloc) {
        bloc.add(const LoadCartEvent(cartItems: []));
        bloc.add(AddItemEvent(item: itemMock));
      },
      expect: () => [
        const CartLoadedState(cartItems: []),
        CartLoadedState(cartItems: listMock),
      ],
    );
  });

  group('[TEST] - DeleteItemEvent', () {
    blocTest(
      'removes an item adter LoadCart',
      build: () => bloc,
      act: (bloc) {
        bloc.add(LoadCartEvent(cartItems: listMock));
        bloc.add(DeleteItemEvent(item: itemMock));
      },
      expect: () => [
        CartLoadedState(cartItems: listMock),
        const CartLoadedState(cartItems: []),
      ],
    );
  });

  group('[TEST] - UpdateItemEvent', () {
    var item = const CartItemModel(
      meal: MealModel(
        photo: '',
        id: 10,
        name: 'name',
        description: 'description',
        price: 10,
        type: MealEnum.doces,
      ),
      quantity: 10,
    );
    blocTest(
      'UPDATES an item adter LoadCart',
      build: () => bloc,
      act: (bloc) {
        bloc.add(LoadCartEvent(cartItems: listMock));
        bloc.add(UpdateItemEvent(item: item));
      },
      expect: () => [
        CartLoadedState(cartItems: listMock),
        CartLoadedState(cartItems: [item]),
      ],
    );
  });
}
