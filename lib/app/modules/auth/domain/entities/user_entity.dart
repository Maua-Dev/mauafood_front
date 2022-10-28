import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String fullName;
  final String cpf;
  final bool isStudent;
  final String email;
  final String password;
  final bool notifications;

  const User({
    required this.id,
    required this.fullName,
    required this.cpf,
    required this.isStudent,
    required this.email,
    required this.password,
    required this.notifications,
  });

  @override
  List<Object?> get props =>
      [id, fullName, cpf, isStudent, email, password, notifications];
}
