
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';

import '../../entities/auth_entity.dart';

class SignInUseCase {
  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);

  Future<bool> call({required String email, required String password}) async {
    AuthEntity authEntity = AuthEntity(email: email, password: password);
    return await _authRepository.signIn(authEntity);
  }

}