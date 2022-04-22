
abstract class SignInUseCase {
  Future<String?> signIn({
    required String email,
    required String password,
  });
}