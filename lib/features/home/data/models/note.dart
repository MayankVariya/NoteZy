import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

part 'note.g.dart';

@freezed
abstract class Note with _$Note {
  const factory Note({
    String? id,
    required String title,
    required String content,
    DateTime? createdAt,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  factory Note.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final Map<String, dynamic>? data = snapshot.data();
    return Note.fromJson(data!);
  }

  factory Note.empty() =>
      Note(id: null, title: '', content: '', createdAt: DateTime.now());
}
