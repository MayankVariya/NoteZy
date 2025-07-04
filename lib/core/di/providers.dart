import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notezy/features/auth/data/services/auth/auth_service.dart';
import 'package:notezy/features/auth/data/services/user/user_service.dart';

import '../../features/auth/data/services/auth/auth_repository_impl.dart';
import '../../features/auth/data/services/user/user_repositiry_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/repositories/user_repository.dart';
import '../../features/home/data/services/note_repository_impl.dart';
import '../../features/home/data/services/note_service.dart';
import '../../features/home/domain/repositories/note_repository.dart';
import '../storage/app_preferences.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

final firebaseFireStoreProvider = Provider((ref) => FirebaseFirestore.instance);

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(
    ref.read(firebaseAuthProvider),
    ref.read(userRepositoryProvider),
    ref.read(currentUserJsonPod.notifier),
  ),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.read(authServiceProvider)),
);

final userServiceProvider = Provider<UserService>(
  (ref) => UserService(ref.read(firebaseFireStoreProvider)),
);

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(userServiceProvider)),
);

final noteServiceProvider = Provider<NoteService>(
  (ref) => NoteService(ref.read(firebaseFireStoreProvider)),
);

final noteRepositoryProvider = Provider<NoteRepository>(
  (ref) => NoteRepositoryImpl(ref.read(noteServiceProvider)),
);
