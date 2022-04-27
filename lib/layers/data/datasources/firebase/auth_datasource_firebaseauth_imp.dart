import 'package:auth_project/layers/data/datasources/auth_datasource.dart';
import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSourceFirebaseAuthImp implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthDataSourceFirebaseAuthImp(this._firebaseAuth);

  @override
  User? getCurrentUser() {
    User? currentUser = _firebaseAuth.currentUser;
    return currentUser;
  }

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<bool> signIn(AuthEntity authEntity) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: authEntity.email,
        password: authEntity.password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  @override
  Future<bool> signUp(AuthEntity authEntity) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: authEntity.email,
        password: authEntity.password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
