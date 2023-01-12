import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/generated/l10n.dart';

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
    return S.current.mealNameSchema(toString());
  }
}
