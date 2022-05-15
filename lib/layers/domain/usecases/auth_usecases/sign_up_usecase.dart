import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/entities/auth_entity.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class SignUpUseCase extends UseCase {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  Future<Either<Failure, bool>> call(AuthEntity authEntity) async {
    return await _authRepository.signUp(authEntity);
  }
}
