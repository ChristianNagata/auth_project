
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

}