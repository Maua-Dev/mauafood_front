// ignore_for_file: constant_identifier_names

import 'package:mauafood_front/generated/l10n.dart';

enum RestaurantEnum { none, biba, hora_h, moleza }

extension RestaurantEnumExtension on RestaurantEnum {
  String get name {
    return S.current.restaurantsNameSchema(toString());
  }

  String get restaurantImg {
    return S.current.restaurantsImageSchema(toString());
  }
}
