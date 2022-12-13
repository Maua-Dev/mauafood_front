import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String cpf;
  final String email;
  final String password;
  final bool emailNotifications;
  final bool appNotifications;
  final bool acceptTerms;
  final String role;

  const User({
    required this.role,
    required this.appNotifications,
    required this.acceptTerms,
    this.id,
    required this.fullName,
    required this.cpf,
    required this.email,
    required this.password,
    required this.emailNotifications,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        cpf,
        email,
        password,
        emailNotifications,
        appNotifications,
        acceptTerms,
        role,
      ];
}
