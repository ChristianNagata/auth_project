import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_up_usecase.dart';

import '../../repositories/auth_repository.dart';

class SignUpUseCaseImp implements SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCaseImp(this._authRepository);

  @override
  Future<bool> signUp({
    required String email,
    required String password1,
    required String password2,
  }) async {
    return await _authRepository.signUp(
      email: email,
      password1: password1,
      password2: password2,
    );
  }
}
