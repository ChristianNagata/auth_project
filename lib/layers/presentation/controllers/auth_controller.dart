import 'package:auth_project/layers/domain/usecases/auth_usecases/get_auth_state_changes_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_current_user_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_in_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_out_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_up_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetAuthStateChangesUseCase _authStateChangesUseCase;
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;
  final SignUpUseCase _signUpUseCase;

  AuthController(
    this._getCurrentUserUseCase,
    this._authStateChangesUseCase,
    this._signInUseCase,
    this._signOutUseCase,
    this._signUpUseCase,
  );

  Stream<User?> get authStateChanges =>
      _authStateChangesUseCase.authStateChanges;

  User? getCurrentUser() {
    return _getCurrentUserUseCase.getCurrentUser();
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    return await _signInUseCase.signIn(email: email, password: password);
  }

  Future<void> signOut() async {
    return await _signOutUseCase.signOut();
  }

  Future<String?> signUp({
    required String email,
    required String password1,
    required String password2,
  }) async {
    return await _signUpUseCase.signUp(
      email: email,
      password1: password1,
      password2: password2,
    );
  }
}
