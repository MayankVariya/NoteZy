abstract class AuthRepository {
  Future<void> login(String email, String password);

  Future<void> signup({
    required String email,
    required String pass,
    String? name,
  });

  Future<void> logout();
}
