import 'package:auth_project/layers/data/datasources/get_current_user_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUserFirestoreDataSourceImp implements GetCurrentUserDataSource {
  FirebaseAuth firebaseAuth;

  GetCurrentUserFirestoreDataSourceImp(this.firebaseAuth);

  @override
  User? call() {
    User? currentUser = firebaseAuth.currentUser;
    return currentUser;
  }
}
