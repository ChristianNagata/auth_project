import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final AuthUseCase _authUseCase;
  AuthController(this._authUseCase);

  Stream<User?> get authStateChanges =>
      _authUseCase.authStateChanges;

  User? getCurrentUser() {
    return _authUseCase.getCurrentUser();
  }

  Future<bool> signIn(AuthEntity authEntity) async {
    return await _authUseCase.signIn(authEntity);
  }

  Future<void> signOut() async {
    return await _authUseCase.signOut();
  }

  Future<bool> signUp(AuthEntity authEntity) async {
    return await _authUseCase.signUp(authEntity);
  }
}
