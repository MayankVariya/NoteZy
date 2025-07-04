import 'package:notezy/features/auth/data/services/user/user_service.dart';
import 'package:notezy/features/auth/domain/models/user_model.dart';

import '../../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService _userService;

  UserRepositoryImpl(this._userService);

  @override
  Future<UserModel?> getUser(String id) => _userService.getUser(id);

  @override
  Future<UserModel> upsertUser({
    required String uid,
    required String email,
    required String pass,
    String? name,
  }) => _userService.upsertUser(uid: uid, email: email, pass: pass, name: name);
}
