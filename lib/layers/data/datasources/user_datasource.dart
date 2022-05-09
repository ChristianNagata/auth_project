

abstract class UserDataSource {
  Future<void> createUser(Map<String, dynamic> user);
  Future<Map<String, dynamic>> readUser(String userId);
}