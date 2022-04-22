import 'package:auth_project/layers/data/datasources/auth_datasource.dart';
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
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    return await _authDataSource.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    return await _authDataSource.signOut();
  }

  @override
  Future<String?> signUp({
    required String email,
    required String password1,
    required String password2,
  }) async {
    return await _authDataSource.signUp(
      email: email,
      password1: password1,
      password2: password2,
    );
  }
}
