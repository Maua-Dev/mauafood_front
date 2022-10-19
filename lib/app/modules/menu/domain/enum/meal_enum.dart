import 'package:enum_to_string/enum_to_string.dart';

enum MealEnum { tudo, lanche, bebida, doce, prato }

extension MealEnumExtension on MealEnum {
  static MealEnum stringToEnumMap(String toMap) {
    MealEnum type = MealEnum.values.firstWhere((type) =>
        EnumToString.convertToString(type).toUpperCase() ==
        toMap.toUpperCase());
    return type;
  }

  String get name {
    switch (this) {
      case MealEnum.lanche:
        return 'Lanche';
      case MealEnum.bebida:
        return 'Bebidas';
      case MealEnum.doce:
        return 'Doces';
      case MealEnum.prato:
        return 'Pratos';
      case MealEnum.tudo:
        return 'Tudo';
    }
  }
}
