import 'package:auth_project/layers/data/datasources/auth_datasource.dart';
import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImp(this._authDataSource);

  @override
  User? getCurrentUser() {
    return _authDataSource.getCurrentUser();
  }

  @override
  Stream<User?> get authStateChanges => _authDataSource.authStateChanges;

  @override
  Future<bool> signIn(AuthEntity authEntity) async {
    return await _authDataSource.signIn(authEntity);
  }

  @override
  Future<void> signOut() async {
    return await _authDataSource.signOut();
  }

  @override
  Future<bool> signUp(AuthEntity authEntity) async {
    return await _authDataSource.signUp(authEntity);
  }
}
