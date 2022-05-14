import 'package:auth_project/layers/domain/repositories/user_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_current_user_usecase.dart';
import '../../entities/user_entity.dart';

class CreateUserUseCase {
  final UserRepository _userRepository;
  final GetCurrentUserUseCase _getCurrentUser;

  CreateUserUseCase(this._getCurrentUser, this._userRepository);

  Future<void> call(
      {required String email,
      required String firstName,
      required String lastName}) async {
    UserEntity userEntity = UserEntity(
      uid: _getCurrentUser()!.uid,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
    return await _userRepository.createUser(userEntity);
  }
}
