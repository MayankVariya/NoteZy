import 'package:notezy/features/auth/data/models/user.dart';

abstract class UserRepository {
  Future<UserModel?> getUser(String id);

  Future<UserModel> upsertUser({
    required String uid,
    required String email,
    required String pass,
    String? name,
  });
}
