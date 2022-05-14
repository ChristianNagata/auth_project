import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUserUseCase {
  final AuthRepository _authRepository;
  GetCurrentUserUseCase(this._authRepository);

  User? call() => _authRepository.getCurrentUser();
}