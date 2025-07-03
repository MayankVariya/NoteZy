import 'package:flutter/material.dart';

import '../../../../navigation/routes.dart';
import '../../data/models/note.dart';
import 'note_list.dart';

class NotesMobileLayout extends StatelessWidget {
  final List<Note> notes;
  final bool isLoading;

  const NotesMobileLayout({
    super.key,
    required this.notes,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return NoteList(
      notes: notes,
      isLoading: isLoading,
      onTap: (note) => EditNoteRoute($extra: note).push(context),
    );
  }
}
