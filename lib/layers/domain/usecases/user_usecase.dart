import 'package:auth_project/layers/domain/entities/user_entity.dart';

abstract class UserUseCase {
  Future<void> createUser({
    required String email,
    required String firstName,
    required String lastName,
  });

  Future<UserEntity> readUser();
}
