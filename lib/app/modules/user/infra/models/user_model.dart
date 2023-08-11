import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.userId,
      required super.name,
      required super.email,
      required super.role,
      required super.photo});

  UserModel.fromUser(User user)
      : super(
            userId: user.userId,
            name: user.name,
            email: user.email,
            role: user.role,
            photo: user.photo);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json['user_id'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
        photo: json['photo']);
  }
  Map<String, dynamic> toUpdatePhoto() {
    return {'new_photo': photo};
  }
}
