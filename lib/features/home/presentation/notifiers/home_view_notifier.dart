import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notezy/core/storage/app_preferences.dart';
import 'package:notezy/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/di/providers.dart';
import '../../domain/models/note.dart';
import '../../domain/repositories/note_repository.dart';

part 'home_view_notifier.freezed.dart';

final homeViewNotifierProvider =
    StateNotifierProvider.autoDispose<HomeViewNotifier, HomeState>((ref) {
      final notifier = HomeViewNotifier(
        ref.read(noteRepositoryProvider),
        ref.read(authRepositoryProvider),
        ref.read(currentUserPod)?.id,
      );
      ref.listen(currentUserPod, (previous, next) {
        notifier._setUserId(next?.id);
      });
      return notifier;
    });

final selectedNoteProvider = StateProvider<Note?>((ref) => null);

class HomeViewNotifier extends StateNotifier<HomeState> {
  final NoteRepository _noteRepository;
  final AuthRepository _authRepository;

  StreamSubscription? _streamSubscription;

  HomeViewNotifier(this._noteRepository, this._authRepository, String? _userId)
    : super(HomeState(currentUserId: _userId)) {
    streamNotes();
  }

  void _setUserId(String? userId) {
    if (userId == null) {
      _streamSubscription?.cancel();
    }
    state = state.copyWith(currentUserId: userId);
    streamNotes();
  }

  void streamNotes() {
    try {
      if (state.currentUserId == null) return;

      _streamSubscription?.cancel();

      state = state.copyWith(loading: true);
      _streamSubscription = _noteRepository
          .streamNotes(state.currentUserId!)
          .listen((notes) {
            state = state.copyWith(loading: false, notes: notes);
          });
    } catch (e) {
      state = state.copyWith(loading: false, error: e);
    }
  }

  void logout() async {
    try {
      await _authRepository.logout();
      state = state.copyWith(loggedOut: true);
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool loading,
    Object? error,
    String? currentUserId,
    @Default(false) bool loggedOut,
    @Default([]) List<Note> notes,
  }) = _HomeState;
}
