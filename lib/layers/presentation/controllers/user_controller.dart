import 'package:auth_project/layers/domain/entities/user_entity.dart';
import 'package:auth_project/layers/domain/usecases/user_usecase.dart';

class UserController {
  final UserUseCase _userUseCase;

  UserController(this._userUseCase);

  Future<void> createUser({
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    return await _userUseCase.createUser(
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }

  Future<UserEntity> readUser() async {
    return await _userUseCase.readUser();
  }

}
