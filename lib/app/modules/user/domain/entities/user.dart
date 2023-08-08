class User {
  final String userId;
  final String name;
  final String email;
  final String role;

  User(
      {required this.userId,
      required this.name,
      required this.email,
      required this.role});

  bool get isEmployee => role == 'employee';
  bool get isUser => role == 'USER';
}
