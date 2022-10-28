import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';

import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../bloc/menu_bloc.dart';

class DropDownRestaurantWidget extends StatelessWidget {
  final RestaurantEnum restaurant;
  const DropDownRestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
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
          BlocProvider.of<MenuBloc>(context)
              .add(ChangeRestaurantEvent(restaurantEnum: value!));
        },
      ),
    );
  }
}
// class MenuAppbarWidget extends StatelessWidget {
//   final String restaurantName;
//   const MenuAppbarWidget({super.key, required this.restaurantName});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(restaurantName, style: AppTextStyles.h1),
//       elevation: 0,
//     );
//   }
// }
