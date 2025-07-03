import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notezy/core/errors/app_error.dart';
import 'package:notezy/features/home/data/models/note.dart';
import 'package:notezy/features/home/domain/repositories/note_repository.dart';

import '../../../../core/utils/firestore_const.dart';

final noteRepositoryProvider = Provider<NoteRepository>(
  (ref) => NoteService(FirebaseFirestore.instance),
);

class NoteService implements NoteRepository {
  final FirebaseFirestore _firestore;

  NoteService(this._firestore);

  CollectionReference<Note> _noteRef(String userId) => _firestore
      .collection(FireStoreConst.usersCollection)
      .doc(userId)
      .collection(FireStoreConst.notesCollection)
      .withConverter<Note>(
        fromFirestore: Note.fromFireStore,
        toFirestore: (user, options) => user.toJson(),
      );

  @override
  Stream<List<Note>> streamNotes(String userId) {
    try {
      return _noteRef(userId).snapshots().map(
        (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
      );
    } catch (e) {
      throw AppError.fromError(e);
    }
  }

  @override
  String generateNoteId(String userId) => _noteRef(userId).doc().id;

  @override
  Future<void> updateNote(String userId, Note note) {
    try {
      return _noteRef(userId).doc(note.id).set(note, SetOptions(merge: true));
    } catch (e) {
      throw AppError.fromError(e);
    }
  }

  @override
  Future<void> deleteNote(String userId, String noteId) {
    try {
      return _noteRef(userId).doc(noteId).delete();
    } catch (e) {
      throw AppError.fromError(e);
    }
  }
}
