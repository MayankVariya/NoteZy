import 'package:notezy/features/auth/data/models/user.dart';

abstract class AuthRepository {
  Future<UserModel?> login(String email, String password);

  Future<UserModel?> signup({
    required String email,
    required String pass,
    String? name,
  });

  Future<void> logout();
}
