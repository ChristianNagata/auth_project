

import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);

  Future<bool> call(AuthEntity authEntity) async {
    return await _authRepository.signUp(authEntity);
  }

}