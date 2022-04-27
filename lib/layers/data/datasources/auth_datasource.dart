import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource  {
  User? getCurrentUser();
  Stream<User?> get authStateChanges;
  Future<void> signOut();
  Future<bool> signIn(AuthEntity authEntity);
  Future<bool> signUp(AuthEntity authEntity);
}