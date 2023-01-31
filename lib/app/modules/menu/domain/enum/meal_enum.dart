import 'package:enum_to_string/enum_to_string.dart';

enum MealEnum {
  tudo,
  lanche,
  bebida,
  doces,
  pratos,
  porcoes,
  massas,
  salgados,
  saladas
}

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
      case MealEnum.doces:
        return 'Doces';
      case MealEnum.pratos:
        return 'Pratos';
      case MealEnum.tudo:
        return 'Tudo';
      case MealEnum.porcoes:
        return 'Porções';
      case MealEnum.massas:
        return 'Massas';
      case MealEnum.salgados:
        return 'Salgados';
      case MealEnum.saladas:
        return 'Saladas';
    }
  }
}
