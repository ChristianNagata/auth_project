
import 'package:auth_project/layers/data/datasources/get_current_user_datasource.dart';
import 'package:auth_project/layers/domain/repositories/get_current_user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUserRepositoryImp implements GetCurrentUserRepository {
  final GetCurrentUserDataSource _getCurrentUserDataSource;
  GetCurrentUserRepositoryImp(this._getCurrentUserDataSource);

  @override
  User? call() {
    return _getCurrentUserDataSource.call();
  }

}