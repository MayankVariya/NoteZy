import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notezy/core/errors/app_error.dart';
import 'package:notezy/features/auth/data/models/user.dart';
import 'package:notezy/features/auth/domain/repositories/user_repository.dart';

import '../../../../core/utils/firestore_const.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserService(FirebaseFirestore.instance),
);

class UserService implements UserRepository {
  final FirebaseFirestore _firestore;

  UserService(this._firestore);

  CollectionReference<UserModel> get _userRef => _firestore
      .collection(FireStoreConst.usersCollection)
      .withConverter<UserModel>(
        fromFirestore: UserModel.fromFireStore,
        toFirestore: (user, options) => user.toJson(),
      );

  @override
  Future<UserModel?> getUser(String id) async {
    try {
      final snapshot = await _userRef.doc(id).get();
      return (snapshot.exists) ? snapshot.data() : null;
    } catch (error) {
      throw AppError.fromError(error);
    }
  }

  @override
  Future<UserModel> upsertUser({
    required String uid,
    required String email,
    required String pass,
    String? name,
  }) async {
    var user = await getUser(uid);
    return user ??= await _createUser(uid, email, pass, name);
  }

  Future<UserModel> _createUser(
    String userId,
    String email,
    String pass,
    String? name,
  ) async {
    final user = UserModel(
      id: userId,
      email: email,
      password: pass,
      user_name: name,
      created_at: DateTime.now(),
    );
    await _userRef.doc(userId).set(user);
    return user;
  }
}
