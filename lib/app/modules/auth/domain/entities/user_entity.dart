import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String cpf;
  final bool isStudent;
  final String email;
  final String password;
  final bool emailNotifications;
  final bool appNotifications;
  final bool acceptTerms;

  const User({
    required this.appNotifications,
    required this.acceptTerms,
    this.id,
    required this.fullName,
    required this.cpf,
    required this.isStudent,
    required this.email,
    required this.password,
    required this.emailNotifications,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        cpf,
        isStudent,
        email,
        password,
        emailNotifications,
        appNotifications,
        acceptTerms,
      ];
}
