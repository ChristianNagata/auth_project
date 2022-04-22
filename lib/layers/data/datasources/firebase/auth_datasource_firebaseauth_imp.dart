import 'package:auth_project/layers/data/datasources/auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSourceFirebaseAuthImp implements AuthDataSource {
  FirebaseAuth firebaseAuth;

  AuthDataSourceFirebaseAuthImp(this.firebaseAuth);

  @override
  User? getCurrentUser() {
    User? currentUser = firebaseAuth.currentUser;
    return currentUser;
  }
}
