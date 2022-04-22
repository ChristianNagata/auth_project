

import 'package:auth_project/layers/domain/repositories/get_current_user_repository.dart';
import 'package:auth_project/layers/domain/usecases/get_current_user_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUserUseCaseImp implements GetCurrentUserUseCase {
  final GetCurrentUserRepository _getCurrentUserRepository;
  GetCurrentUserUseCaseImp(this._getCurrentUserRepository);

  @override
  User? call() {
    return _getCurrentUserRepository.call();
  }

}