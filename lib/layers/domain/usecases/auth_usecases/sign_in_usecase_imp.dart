import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_in_usecase.dart';

class SignInUseCaseImp implements SignInUseCase {
  final AuthRepository _authRepository;
  SignInUseCaseImp(this._authRepository);

  @override
  Future<bool> signIn(AuthEntity authEntity) async {
    return await _authRepository.signIn(authEntity);
  }
}