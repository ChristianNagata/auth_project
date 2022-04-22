

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource  {
  User? getCurrentUser();
  Stream<User?> get authStateChanges;
  Future<void> signOut();
  Future<String?> signIn({
    required String email,
    required String password,
  });
  Future<String?> signUp({
    required String email,
    required String password1,
    required String password2,
  });
}