import 'package:auth_project/layers/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  const UserDto({
    required String uid,
    required String firstName,
    required String lastName,
    required String email,
  }) : super(
          uid: uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
        );

  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
  }

  factory UserDto.fromEntity(UserEntity userEntity) {
    return UserDto(
      uid: userEntity.uid,
      firstName: userEntity.firstName,
      lastName: userEntity.lastName,
      email: userEntity.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
    );
  }
}
