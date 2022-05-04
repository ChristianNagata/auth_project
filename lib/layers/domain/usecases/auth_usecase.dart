import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthUseCase {
  User? getCurrentUser();
  Stream<User?> get authStateChanges;
  Future<void> signOut();
  Future<bool> signIn({required String email, required String password});
  Future<bool> signUp(AuthEntity authEntity);
}