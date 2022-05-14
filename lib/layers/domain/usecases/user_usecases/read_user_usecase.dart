import 'package:auth_project/layers/domain/repositories/user_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_current_user_usecase.dart';
import '../../entities/user_entity.dart';

class ReadUserUseCase {
  final UserRepository _userRepository;
  final GetCurrentUserUseCase _getCurrentUser;

  ReadUserUseCase(
    this._userRepository,
    this._getCurrentUser,
  );

  Future<UserEntity> call() async {
    String userId = _getCurrentUser()!.uid;
    return await _userRepository.readUser(userId);
  }
}
