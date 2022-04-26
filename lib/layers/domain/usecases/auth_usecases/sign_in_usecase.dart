
abstract class SignInUseCase {
  Future<bool> signIn({
    required String email,
    required String password,
  });
}