import 'package:notezy/features/home/data/services/note_service.dart';
import 'package:notezy/features/home/domain/models/note.dart';

import '../../domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteService _noteService;

  NoteRepositoryImpl(this._noteService);

  @override
  Future<void> deleteNote(String userId, String noteId) =>
      _noteService.deleteNote(userId, noteId);

  @override
  String generateNoteId(String userId) => _noteService.generateNoteId(userId);

  @override
  Stream<List<Note>> streamNotes(String userId) =>
      _noteService.streamNotes(userId);

  @override
  Future<void> updateNote(String userId, Note note) =>
      _noteService.updateNote(userId, note);
}
