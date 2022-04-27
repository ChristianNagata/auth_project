

import 'package:auth_project/layers/domain/entities/auth_entity.dart';

abstract class SignUpUseCase {
  Future<bool> signUp(AuthEntity authEntity);
}