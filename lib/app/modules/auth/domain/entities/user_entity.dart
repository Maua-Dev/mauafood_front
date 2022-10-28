import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String lastName;
  final String cpf;
  final String isStudent;
  final String email;
  final String password;
  final bool notifications;

  const User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.cpf,
    required this.isStudent,
    required this.email,
    required this.password,
    required this.notifications,
  });

  @override
  List<Object?> get props =>
      [id, name, lastName, cpf, isStudent, email, password, notifications];
}
