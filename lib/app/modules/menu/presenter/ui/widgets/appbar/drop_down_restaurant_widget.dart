import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/cart/presenter/bloc/cart_bloc.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';

import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/widgets/alert_dialog_custom_widget.dart';
import '../../../bloc/menu_bloc.dart';

class DropDownRestaurantWidget extends StatelessWidget {
  final RestaurantEnum restaurant;
  const DropDownRestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    MenuBloc menuBloc = Modular.get<MenuBloc>();
    CartBloc cartBloc = Modular.get<CartBloc>();
    return BlocProvider.value(
      value: menuBloc,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          value: restaurant,
          items: RestaurantEnum.values.map((RestaurantEnum value) {
            return DropdownMenuItem<RestaurantEnum>(
              value: value,
              child: Text(value.name, style: AppTextStyles.h1),
            );
          }).toList(),
          onChanged: (value) {
            var state = cartBloc.state;
            if (state is CartLoadedState) {
              state.cartItems.isNotEmpty
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialogCustomWidget(
                          title:
                              'Tem certeza que deseja continuar? Se houver algo no carrinho será limpo.',
                          cancelTitle: 'Cancelar',
                          confirmTitle: 'Continuar',
                          confirmOnPressed: () {
                            menuBloc.add(
                                ChangeRestaurantEvent(restaurantEnum: value!));
                            cartBloc.add(const LoadCartEvent());
                            Modular.to.pop();
                          },
                          cancelOnPressed: () => Modular.to.pop(),
                        );
                      },
                    )
                  : menuBloc.add(
                      ChangeRestaurantEvent(restaurantEnum: value!),
                    );
            }
          },
        ),
      ),
    );
  }
}
