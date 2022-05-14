import 'package:auth_project/layers/domain/entities/auth_entity.dart';

class AuthDto extends AuthEntity {
  const AuthDto({
    required String email,
    required String password,
  }) : super(email: email, password: password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory AuthDto.fromMap(Map<String, dynamic> map) {
    return AuthDto(
      email: map['email'],
      password: map['password'],
    );
  }
}
