import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Entity should not be null', () {
    AuthEntity authEntity = AuthEntity(
      email: 'email_test@test.com',
      password: 'testpassword',
    );
    expect(authEntity, isNotNull);
  });

  test('Passwords should be equals', () {
    AuthEntity authEntity = AuthEntity(
      email: 'email_test@test.com',
      password: 'testpassword',
      password2: 'testpassword',
    );
    expect(authEntity.passwordsEquals(), true);
  });

  test('Passwords should be different', () {
    AuthEntity authEntity = AuthEntity(
      email: 'email_test@test.com',
      password: 'testpassword',
      password2: 'passwordtest',
    );
    expect(authEntity.passwordsEquals(), true);
  });
}
