class User {
  final String userId;
  final String name;
  final String email;
  final String role;
  final String photo;

  User(
      {required this.userId,
      required this.name,
      required this.email,
      required this.role,
      required this.photo});

  bool get isEmployee => role == 'OWNER';
  bool get isUser => role == 'USER';

  User copyWith({String? name, String? photo}) {
    return User(
        userId: userId,
        name: name ?? this.name,
        email: email,
        role: role,
        photo: photo ?? this.photo);
  }
}
