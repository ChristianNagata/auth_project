

abstract class SignUpUseCase {
  Future<String?> signUp({
    required String email,
    required String password1,
    required String password2,
  });
}