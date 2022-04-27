class AuthEntity {
  String email;
  String password;
  String? password2;

  AuthEntity({
    this.password2,
    required this.email,
    required this.password,
  });

  bool passwordsEquals() {
    return password == password2;
  }
}
