import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {


  Stream<User?> get authStateChanges =>
      throw UnimplementedError();

  User? getCurrentUser() {
    throw UnimplementedError();
  }

  Future<bool> signIn({required String email, required String password}) async {
    throw UnimplementedError();
  }

  Future<void> signOut() async {
    throw UnimplementedError();
  }

  Future<bool> signUp(AuthEntity authEntity) async {
    throw UnimplementedError();
  }
}
