import 'package:firebase_auth/firebase_auth.dart';
import 'package:notezy/core/errors/app_error.dart';
import 'package:notezy/core/storage/provider.dart';
import 'package:notezy/features/auth/domain/repositories/user_repository.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final UserRepository _userRepository;

  final PreferenceNotifier<String?> _currentUserNotifier;

  AuthService(
    this._firebaseAuth,
    this._userRepository,
    this._currentUserNotifier,
  );

  Future<void> login(String email, String password) async {
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
      }
    } catch (e) {
      throw AppError.fromError(e);
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      _currentUserNotifier.state = null;
    } catch (e) {
      throw AppError.fromError(e);
    }
  }

  Future<void> signup({
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
      }
    } catch (e) {
      throw AppError.fromError(e);
    }
  }
}
