// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/generated/l10n.dart';

enum StatusEnum {
  ALL,
  PENDING,
  IN_PREPARATION,
  READY,
  CANCELED,
}

extension StatusEnumExtension on StatusEnum {
  static StatusEnum stringToEnumMap(String toMap) {
    StatusEnum status = StatusEnum.values.firstWhere((role) =>
        EnumToString.convertToString(role).toUpperCase() ==
        toMap.toUpperCase());
    return status;
  }

  String get name {
    return S.current.statusNameSchema(toString());
  }
}
