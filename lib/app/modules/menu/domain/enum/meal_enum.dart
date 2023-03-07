// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/generated/l10n.dart';

enum MealEnum {
  ALL,
  SANDWICHES,
  DRINKS,
  CANDIES,
  PLATES,
  PORTIONS,
  SNACKS,
  PASTAS,
  SALADS,
  DESSERT,
  SAVOURY,
}

extension MealEnumExtension on MealEnum {
  static MealEnum stringToEnumMap(String toMap) {
    MealEnum type = MealEnum.values.firstWhere((type) =>
        EnumToString.convertToString(type).toUpperCase() ==
        toMap.toUpperCase());
    return type;
  }

  String get name {
    return S.current.mealNameSchema(toString());
  }
}
