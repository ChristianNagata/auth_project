import 'package:auth_project/layers/domain/repositories/user_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecase.dart';

import '../../entities/user_entity.dart';

class ReadUserUseCase {
  final UserRepository _userRepository;
  final AuthUseCase _authUseCase;

  ReadUserUseCase(
    this._userRepository,
    this._authUseCase,
  );

  Future<UserEntity> call() async {
    String userId = _authUseCase.getCurrentUser()!.uid;
    return await _userRepository.readUser(userId);
  }
}
