// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/app/shared/helpers/utils/string_helper.dart';

import '../../../../generated/l10n.dart';

enum ProductEnum {
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

extension ProductEnumExtension on ProductEnum {
  static ProductEnum stringToEnumMap(String toMap) {
    ProductEnum type = ProductEnum.values.firstWhere((type) =>
        EnumToString.convertToString(type).toUpperCase() ==
        toMap.toUpperCase());
    return type;
  }

  String get name {
    return S.current.productNameSchema(toString());
  }
}
