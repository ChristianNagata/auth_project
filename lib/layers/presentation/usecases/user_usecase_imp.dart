import 'package:auth_project/layers/domain/entities/user_entity.dart';
import 'package:auth_project/layers/domain/repositories/user_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecase.dart';
import 'package:auth_project/layers/domain/usecases/user_usecase.dart';

class UserUseCaseImp implements UserUseCase {
  final UserRepository _userRepository;
  final AuthUseCase _authUseCase;

  UserUseCaseImp(this._userRepository, this._authUseCase);

  @override
  Future<void> createUser(
      {required String email,
      required String firstName,
      required String lastName}) async {
    UserEntity userEntity = UserEntity(
      uid: _authUseCase.getCurrentUser()!.uid,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
    return await _userRepository.createUser(userEntity);
  }

  @override
  Future<UserEntity> readUser() async {
    String userId = _authUseCase.getCurrentUser()!.uid;
    return await _userRepository.readUser(userId);
  }
}
