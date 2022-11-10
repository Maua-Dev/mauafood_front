import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';
import 'package:mauafood_front/app/modules/meal-info/meal_info_module.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/bloc/demand_bloc.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  initModules([AppModule(), MealInfoModule()]);
  MealModel mealMock = const MealModel(
    id: 0,
    name: 'name',
    description: 'description',
    price: 10,
    type: MealEnum.bebida,
    photo: '',
  );
  CartItemModel itemMock = CartItemModel(meal: mealMock, quantity: 4);

  late DemandBloc bloc;

  setUp(() {
    bloc = DemandBloc();
  });

  group('[TEST] - LoadEvent', () {
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        bloc.add(LoadEvent(item: itemMock));
      },
      expect: () => [
        DemandLoadedState(item: itemMock),
      ],
    );
  });

  group('[TEST] - AddQuantityEvent', () {
    blocTest(
      'if quantity >= 0 adds quantity',
      build: () => bloc,
      act: (bloc) {
        bloc.add(AddQuantityEvent(item: itemMock));
      },
      expect: () => [
        DemandLoadingState(),
        DemandLoadedState(
            item:
                CartItemModel(meal: mealMock, quantity: itemMock.quantity + 1)),
      ],
    );
  });

  group('[TEST] - RemoveQuantityEvent', () {
    blocTest(
      'if quantity > 0 adds quantity',
      build: () => bloc,
      act: (bloc) {
        bloc.add(RemoveQuantityEvent(item: itemMock));
      },
      expect: () => [
        DemandLoadingState(),
        DemandLoadedState(
            item:
                CartItemModel(meal: mealMock, quantity: itemMock.quantity - 1)),
      ],
    );
  });
}
