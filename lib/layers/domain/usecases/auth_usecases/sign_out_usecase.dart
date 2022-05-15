import 'package:auth_project/core/usecases/usecase.dart';
import 'package:auth_project/layers/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class SignOutUseCase extends UseCase {
  final AuthRepository _authRepository;

  SignOutUseCase(this._authRepository);

  Future<Either<Failure, bool>> call() async {
    return await _authRepository.signOut();
  }
}
