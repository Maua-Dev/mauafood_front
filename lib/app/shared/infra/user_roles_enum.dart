// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';

enum UserRolesEnum {
  employee_h,
  employee_biba,
  user,
  student,
}

extension UserRolesEnumExtension on UserRolesEnum {
  String get name {
    switch (this) {
      case UserRolesEnum.employee_h:
        return 'Employee H';
      case UserRolesEnum.employee_biba:
        return 'Employee';
      case UserRolesEnum.user:
        return 'User';
      case UserRolesEnum.student:
        return 'Student';
    }
  }

  RestaurantEnum get restaurantEnum {
    switch (this) {
      case UserRolesEnum.employee_h:
        return RestaurantEnum.hora_h;
      case UserRolesEnum.employee_biba:
        return RestaurantEnum.biba;
      case UserRolesEnum.user:
        return RestaurantEnum.none;
      case UserRolesEnum.student:
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
