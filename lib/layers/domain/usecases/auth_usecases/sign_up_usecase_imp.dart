import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_up_usecase.dart';

class SignUpUseCaseImp implements SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCaseImp(this._authRepository);

  @override
  Future<bool> signUp(AuthEntity authEntity) async {
    return await _authRepository.signUp(authEntity);
  }
}
