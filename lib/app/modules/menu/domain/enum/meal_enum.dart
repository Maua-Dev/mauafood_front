import 'package:enum_to_string/enum_to_string.dart';

enum MealEnum { lanche, bebida, doce, prato }

extension MealEnumExtension on MealEnum {
  static MealEnum stringToEnumMap(String toMap) {
    MealEnum type = MealEnum.values.firstWhere((type) =>
        EnumToString.convertToString(type).toUpperCase() ==
        toMap.toUpperCase());
    return type;
  }
}
