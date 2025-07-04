import 'package:notezy/features/auth/data/services/auth/auth_service.dart';
import 'package:notezy/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<void> login(String email, String password) =>
      _authService.login(email, password);

  @override
  Future<void> logout() => _authService.logout();

  @override
  Future<dynamic> signup({
    required String email,
    required String pass,
    String? name,
  }) => _authService.signup(email: email, pass: pass, name: name);
}
