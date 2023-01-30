import 'package:mauafood_front/app/modules/auth/domain/entities/user_entity.dart';

class UserModel extends User {
  const UserModel({
    super.id,
    required super.fullName,
    required super.cpf,
    required super.isStudent,
    required super.email,
    required super.password,
    required super.appNotifications,
    required super.emailNotifications,
    required super.acceptTerms,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      cpf: json['cpf'],
      isStudent: json['isStudent'],
      email: json['email'],
      password: json['password'],
      emailNotifications: json['emailNotifications'],
      appNotifications: json['appNotifications'],
      acceptTerms: json['acceptTerms'],
    );
  }
}
