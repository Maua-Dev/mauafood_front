// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

enum UserRolesEnum {
  EMPLOYEE_H,
  EMPLOYEE_BIBA,
  USER,
  STUDENT,
}

extension UserRolesEnumExtension on UserRolesEnum {
  String get userRoleName {
    switch (this) {
      case UserRolesEnum.EMPLOYEE_H:
        return 'Employee H';
      case UserRolesEnum.EMPLOYEE_BIBA:
        return 'Employee';
      case UserRolesEnum.USER:
        return 'User';
      case UserRolesEnum.STUDENT:
        return 'Student';
    }
  }

  RestaurantEnum get restaurantEnum {
    switch (this) {
      case UserRolesEnum.EMPLOYEE_H:
        return RestaurantEnum.hora_h;
      case UserRolesEnum.EMPLOYEE_BIBA:
        return RestaurantEnum.biba;
      case UserRolesEnum.USER:
        return RestaurantEnum.none;
      case UserRolesEnum.STUDENT:
        return RestaurantEnum.none;
    }
  }

  static UserRolesEnum stringToEnumMap(String toMap) {
    UserRolesEnum role = UserRolesEnum.values.firstWhere((role) =>
        EnumToString.convertToString(role).toUpperCase() ==
        toMap.toUpperCase());
    return role;
  }

  static String enumToStringMap(UserRolesEnum role) {
    return EnumToString.convertToString(role);
  }
}
