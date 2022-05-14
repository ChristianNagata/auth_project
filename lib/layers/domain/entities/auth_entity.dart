import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String email;
  final String password;
  final String? password2;

  const AuthEntity({
    this.password2,
    required this.email,
    required this.password,
  });

  bool passwordsEquals() {
    return password == password2;
  }

  @override
  List<Object?> get props => [email, password];
}
