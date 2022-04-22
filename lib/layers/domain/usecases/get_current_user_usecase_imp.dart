

import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:auth_project/layers/domain/usecases/get_current_user_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUserUseCaseImp implements GetCurrentUserUseCase {
  final AuthRepository _authRepository;
  GetCurrentUserUseCaseImp(this._authRepository);

  @override
  User? call() {
    return _authRepository.getCurrentUser();
  }

}