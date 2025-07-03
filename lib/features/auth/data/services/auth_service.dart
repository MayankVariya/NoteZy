import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notezy/core/errors/app_error.dart';
import 'package:notezy/core/storage/provider.dart';
import 'package:notezy/features/auth/data/models/user.dart';
import 'package:notezy/features/auth/domain/repositories/auth_repository.dart';
import 'package:notezy/features/auth/domain/repositories/user_repository.dart';

import '../../../../core/storage/app_preferences.dart';
import 'user_service.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthService(
    ref.read(firebaseAuthProvider),
    ref.read(userRepositoryProvider),
    ref.read(currentUserJsonPod.notifier),
  ),
);

class AuthService implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final UserRepository _userRepository;

  final PreferenceNotifier<String?> _currentUserNotifier;

  AuthService(
    this._firebaseAuth,
    this._userRepository,
    this._currentUserNotifier,
  );

  @override
  Future<UserModel?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        final user = await _userRepository.upsertUser(
          uid: userCredential.user!.uid,
          email: email,
          pass: password,
        );
        _currentUserNotifier.state = user.toJsonString();
        return user;
      }
      return null;
    } catch (e) {
      throw AppError.fromError(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      _currentUserNotifier.state = null;
    } catch (e) {
      throw AppError.fromError(e);
    }
  }

  @override
  Future<UserModel?> signup({
    required String email,
    required String pass,
    String? name,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      if (credential.user != null) {
        final user = await _userRepository.upsertUser(
          uid: credential.user!.uid,
          email: email,
          pass: pass,
          name: name,
        );
        _currentUserNotifier.state = user.toJsonString();
        return user;
      }
      return null;
    } catch (e) {
      throw AppError.fromError(e);
    }
  }
}
