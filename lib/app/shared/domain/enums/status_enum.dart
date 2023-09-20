// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/generated/l10n.dart';

enum StatusEnum {
  ALL,
  PENDING,
  PREPARING,
  READY,
  REFUSED,
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

  Color get color {
    switch (this) {
      case StatusEnum.PENDING:
        return AppColors.violetColor;
      case StatusEnum.PREPARING:
        return AppColors.yellowColor;
      case StatusEnum.READY:
        return AppColors.greenColor;
      case StatusEnum.REFUSED:
        return AppColors.redColor;
      case StatusEnum.CANCELED:
        return AppColors.letterColor;
      default:
        return AppColors.mainBlueColor;
    }
  }
}
