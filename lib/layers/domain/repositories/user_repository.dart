

import 'package:auth_project/layers/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> createUser(UserEntity user);
  Future<UserEntity> readUser(String id);
}