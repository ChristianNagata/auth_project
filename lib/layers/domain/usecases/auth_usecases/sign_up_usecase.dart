

abstract class SignUpUseCase {
  Future<bool> signUp({
    required String email,
    required String password1,
    required String password2,
  });
}