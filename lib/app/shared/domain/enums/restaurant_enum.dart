// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/generated/l10n.dart';

enum  RestaurantEnum { none, souza_de_abreu, hora_h, cantina_do_moleza }

extension RestaurantEnumExtension on RestaurantEnum {
  String get restaurantName {
    return S.current.restaurantsNameSchema(toString());
  }

  String get restaurantImg {
    return S.current.restaurantsImageSchema(toString());
  }

  static String enumToStringMap(RestaurantEnum restaurant) {
    return EnumToString.convertToString(restaurant).toUpperCase();
  }
}
