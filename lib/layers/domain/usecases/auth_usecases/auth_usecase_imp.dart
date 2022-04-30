

import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUseCaseImp implements AuthUseCase {
  final AuthRepository _authRepository;
  AuthUseCaseImp(this._authRepository);

  @override
  Stream<User?> get authStateChanges => _authRepository.authStateChanges;

  @override
  User? getCurrentUser() {
    return _authRepository.getCurrentUser();
  }

  @override
  Future<bool> signIn(AuthEntity authEntity) async {
    return await _authRepository.signIn(authEntity);
  }

  @override
  Future<void> signOut() async {
    return await _authRepository.signOut();
  }

  @override
  Future<bool> signUp(AuthEntity authEntity) async {
    return await _authRepository.signUp(authEntity);
  }

}