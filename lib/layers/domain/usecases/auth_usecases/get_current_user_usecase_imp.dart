

import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_current_user_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUserUseCaseImp implements GetCurrentUserUseCase {
  final AuthRepository _authRepository;
  GetCurrentUserUseCaseImp(this._authRepository);

  @override
  User? getCurrentUser() {
    return _authRepository.getCurrentUser();
  }

}