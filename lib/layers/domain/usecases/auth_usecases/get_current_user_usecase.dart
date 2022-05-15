import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';

class GetCurrentUserUseCase extends UseCase {
  final AuthRepository _authRepository;
  GetCurrentUserUseCase(this._authRepository);

  Either<Failure, User?> call() => _authRepository.getCurrentUser();
}