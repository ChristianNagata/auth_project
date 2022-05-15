
import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../entities/auth_entity.dart';

class SignInUseCase extends UseCase {
  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);

  Future<Either<Failure, bool>> call({required String email, required String password}) async {
    AuthEntity authEntity = AuthEntity(email: email, password: password);
    return await _authRepository.signIn(authEntity);
  }

}