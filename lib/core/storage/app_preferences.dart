import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notezy/core/storage/provider.dart';

import '../../features/auth/domain/models/user_model.dart';
import '../di/providers.dart';

final currentUserPod = Provider<UserModel?>((ref) {
  final json = ref.watch(currentUserJsonPod);
  return json == null ? null : UserModel.fromJsonString(json);
});

final hasAuth = StateProvider<bool>((ref) {
  final firebaseAuth = ref.read(firebaseAuthProvider);
  return firebaseAuth.currentUser != null;
});

final currentUserJsonPod = createPrefProvider<String?>(
  prefKey: "user_account",
  defaultValue: null,
);
