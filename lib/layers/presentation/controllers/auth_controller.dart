import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/auth_state_changes_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/get_current_user_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_in_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_out_usecase.dart';
import 'package:auth_project/layers/domain/usecases/auth_usecases/sign_up_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/error/failures.dart';

class AuthController {
  final AuthStateChangesUseCase _authStateChanges;
  final GetCurrentUserUseCase _getCurrentUser;
  final SignInUseCase _signIn;
  final SignOutUseCase _signOut;
  final SignUpUseCase _signUp;

  AuthController(
    this._authStateChanges,
    this._getCurrentUser,
    this._signIn,
    this._signOut,
    this._signUp,
  );

  Either<Failure, Stream<User?>> get authStateChanges =>
      _authStateChanges();

  Either<Failure, User?> getCurrentUser() {
    return _getCurrentUser();
  }

  Future<Either<Failure, bool>> signIn(
      {required String email, required String password}) async {
    return await _signIn(email: email, password: password);
  }

  Future<Either<Failure, bool>> signOut() async {
    return await _signOut();
  }

  Future<Either<Failure, bool>> signUp(AuthEntity authEntity) async {
    return await _signUp(authEntity);
  }
}
