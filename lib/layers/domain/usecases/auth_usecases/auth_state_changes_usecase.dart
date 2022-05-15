
import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';

class AuthStateChangesUseCase extends UseCase {
  final AuthRepository _authRepository;
  AuthStateChangesUseCase(this._authRepository);

  Either<Failure, Stream<User?>> call() {
    return _authRepository.authStateChanges;
  }
}