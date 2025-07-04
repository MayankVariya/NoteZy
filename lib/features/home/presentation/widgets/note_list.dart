import 'package:flutter/material.dart';
import 'package:notezy/core/extensions/context_extension.dart';

import '../../../../shared/typography/typography.dart';
import '../../domain/models/note.dart';

class NoteList extends StatelessWidget {
  final List<Note> notes;
  final Function(Note) onTap;
  final Note? selectedNote;
  final bool isLoading;

  const NoteList({
    super.key,
    required this.notes,
    required this.onTap,
    this.selectedNote,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: const CircularProgressIndicator());
    }

    if (notes.isEmpty) {
      return Center(
        child: Text(
          context.l10n.home_screen_empty_notes_title,
          style: AppTextStyles.subtitle1.copyWith(
            color: context.colorScheme.textPrimary,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(16) + EdgeInsets.only(bottom: 40),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return _noteItem(
          context,
          note: note,
          isSelected: note == selectedNote,
          onTap: () => onTap(note),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }

  Widget _noteItem(
    BuildContext context, {
    required Note note,
    required Function()? onTap,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colorScheme.containerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.outline,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.subtitle1.copyWith(
                      color: context.colorScheme.textPrimary,
                    ),
                  ),
                ),
                if (isSelected) ...[
                  const Spacer(),
                  Icon(Icons.check, color: context.colorScheme.primary),
                ],
              ],
            ),
            const SizedBox(height: 8),
            Text(
              note.content,
              maxLines: 4,
              style: AppTextStyles.body2.copyWith(
                color: context.colorScheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
