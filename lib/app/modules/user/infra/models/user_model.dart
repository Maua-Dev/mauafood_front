import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.userId,
      required super.name,
      required super.email,
      required super.role});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json['user_id'],
        name: json['name'],
        email: json['email'],
        role: json['role']);
  }
}
