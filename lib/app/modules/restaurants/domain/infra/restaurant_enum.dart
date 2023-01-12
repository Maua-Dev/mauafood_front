import 'package:mauafood_front/generated/l10n.dart';

enum RestaurantEnum { restaurantBiba, restaurantH }

extension RestaurantEnumExtension on RestaurantEnum {
  String get name {
    switch (this) {
      case RestaurantEnum.restaurantBiba:
        return S.current.restaurantsNameSchema('biba');
      case RestaurantEnum.restaurantH:
        return S.current.restaurantsNameSchema('h');
    }
  }

  String get restaurantImg {
    switch (this) {
      case RestaurantEnum.restaurantBiba:
        return S.current.restaurantsImageSchema('biba');

      case RestaurantEnum.restaurantH:
        return S.current.restaurantsImageSchema('h');
    }
  }
}
