


import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_auth_state_changes_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetAuthStateChangesUseCaseImp implements GetAuthStateChangesUseCase {
  final AuthRepository _authRepository;
  GetAuthStateChangesUseCaseImp(this._authRepository);

  @override
  Stream<User?> get authStateChanges => _authRepository.authStateChanges;
}