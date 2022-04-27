
import 'package:auth_project/layers/domain/entities/auth_entity.dart';

abstract class SignInUseCase {
  Future<bool> signIn(AuthEntity authEntity);
}