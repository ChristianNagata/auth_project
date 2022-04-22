

import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_out_usecase.dart';

class SignOutUseCaseImp implements SignOutUseCase {
  final AuthRepository _authRepository;
  SignOutUseCaseImp(this._authRepository);

  @override
  Future<void> signOut() async {
    return await _authRepository.signOut();
  }

}