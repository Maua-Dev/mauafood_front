// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

enum StatusEnum { PENDING, IN_PREPARATION, READY }

extension StatusEnumExtension on StatusEnum {
  String get statusName {
    switch (this) {
      case StatusEnum.PENDING:
        return 'Pending';
      case StatusEnum.IN_PREPARATION:
        return 'In Preparation';
      case StatusEnum.READY:
        return 'Ready';
    }
  }

  static StatusEnum stringToEnumMap(String toMap) {
    StatusEnum role = StatusEnum.values.firstWhere((role) =>
        EnumToString.convertToString(role).toUpperCase() ==
        toMap.toUpperCase());
    return role;
  }

  static String enumToStringMap(StatusEnum role) {
    return EnumToString.convertToString(role);
  }
}
