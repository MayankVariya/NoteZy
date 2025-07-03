import '../../data/models/note.dart';

abstract class NoteRepository {
  Stream<List<Note>> streamNotes(String userId);

  String generateNoteId(String userId);

  Future<void> updateNote(String userId, Note note);

  Future<void> deleteNote(String userId, String noteId);
}
