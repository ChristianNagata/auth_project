

import 'package:auth_project/layers/domain/usecases/get_current_user_usecase.dart';

class UserController {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  UserController(this._getCurrentUserUseCase);

  getCurrentUser() {
    return _getCurrentUserUseCase.call();
  }
}