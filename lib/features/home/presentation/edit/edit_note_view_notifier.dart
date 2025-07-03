import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notezy/core/storage/app_preferences.dart';

import '../../data/models/note.dart';
import '../../data/services/note_service.dart';
import '../../domain/repositories/note_repository.dart';

part 'edit_note_view_notifier.freezed.dart';

final editNoteViewNotifierProvider =
    StateNotifierProvider.autoDispose<EditNoteViewNotifier, EditNoteState>(
      (ref) => EditNoteViewNotifier(
        ref.watch(noteRepositoryProvider),
        ref.read(currentUserPod)?.id,
      ),
    );

class EditNoteViewNotifier extends StateNotifier<EditNoteState> {
  final NoteRepository _noteRepository;
  final String? _userId;

  EditNoteViewNotifier(this._noteRepository, this._userId)
    : super(
        EditNoteState(
          titleController: TextEditingController(),
          noteController: TextEditingController(),
        ),
      );

  void setData(Note? note) {
    if (note == null) return;
    state.titleController.text = note.title;
    state.noteController.text = note.content;
    state = state.copyWith(note: note);
  }

  void onChanged(String value) {
    final enabled =
        state.titleController.text.trim().isNotEmpty &&
        state.noteController.text.trim().isNotEmpty;
    state = state.copyWith(enabled: enabled);
  }

  void saveNote() async {
    try {
      state = state.copyWith(loading: true);
      final title = state.titleController.text.trim();
      final content = state.noteController.text.trim();

      final id = state.note?.id ?? _noteRepository.generateNoteId(_userId!);

      final note = Note(
        id: id,
        title: title,
        content: content,
        createdAt: state.note?.createdAt ?? DateTime.now(),
      );
      await _noteRepository.updateNote(_userId!, note);
      state = state.copyWith(loading: false, pop: true, enabled: false);
    } catch (e) {
      state = state.copyWith(loading: false, error: e);
    }
  }

  void deleteNote() {
    try {
      state = state.copyWith(loading: true);
      _noteRepository.deleteNote(_userId!, state.note!.id!);
      state = state.copyWith(pop: true, loading: false);
    } catch (e) {
      state = state.copyWith(loading: false, error: e);
    }
  }
}

@freezed
abstract class EditNoteState with _$EditNoteState {
  const factory EditNoteState({
    required TextEditingController titleController,
    required TextEditingController noteController,
    @Default(false) bool loading,
    @Default(false) bool enabled,
    @Default(false) bool pop,
    Object? error,
    Note? note,
  }) = _EditNoteState;
}
