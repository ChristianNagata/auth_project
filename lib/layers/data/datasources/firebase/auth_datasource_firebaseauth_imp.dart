import 'package:auth_project/layers/data/datasources/auth_datasource.dart';
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
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  @override
  Future<bool> signUp({
    required String email,
    required String password1,
    required String password2,
  }) async {
    try {
      if (password1 == password2) {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password1);
        return true;
      } else {
        print('The passwords must be equals');
        return false;
      }
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
