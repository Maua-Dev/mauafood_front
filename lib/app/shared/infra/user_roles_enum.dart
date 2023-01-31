import 'package:enum_to_string/enum_to_string.dart';

enum UserRolesEnum {
  employee,
  user,
  student,
}

extension UserRolesEnumExtension on UserRolesEnum {
  String get name {
    switch (this) {
      case UserRolesEnum.employee:
        return 'Employee';
      case UserRolesEnum.user:
        return 'User';
      case UserRolesEnum.student:
        return 'Student';
    }
  }

  static UserRolesEnum stringToEnumMap(String toMap) {
    UserRolesEnum modality = UserRolesEnum.values.firstWhere((modality) =>
        EnumToString.convertToString(modality).toUpperCase() ==
        toMap.toUpperCase());
    return modality;
  }

  static String enumToStringMap(UserRolesEnum modality) {
    return EnumToString.convertToString(modality);
  }
}
