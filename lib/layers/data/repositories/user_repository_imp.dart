

import 'package:auth_project/layers/data/datasources/user_datasource.dart';
import 'package:auth_project/layers/data/dtos/user_dto.dart';
import 'package:auth_project/layers/domain/entities/user_entity.dart';
import 'package:auth_project/layers/domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserDataSource _userDataSource;
  UserRepositoryImp(this._userDataSource);

  @override
  Future<void> createUser(UserEntity user) async {
    UserDto userDto = UserDto.fromEntity(user);
    Map<String, dynamic> userMap = userDto.toMap();
    return await _userDataSource.createUser(userMap);
  }

  @override
  Future<UserEntity> readUser(String id) async {
    Map<String, dynamic> userMap = await _userDataSource.readUser(id);
    UserDto userDto = UserDto.fromMap(userMap);
    UserEntity userEntity = userDto.toEntity();
    return userEntity;
  }

}