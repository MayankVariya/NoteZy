import 'package:flutter/material.dart';
import 'package:notezy/core/extensions/context_extension.dart';
import 'package:notezy/features/home/presentation/components/note_list.dart';
import 'package:notezy/shared/widgets/icon_button.dart';

import '../../../../shared/typography/typography.dart';
import '../../data/models/note.dart';
import '../edit/edit_note_screen.dart';

class NotesTabletLayout extends StatefulWidget {
  final bool isLoading;
  final List<Note> notes;
  final Note? selectedNote;
  final Function(Note) onNoteSelected;
  final Function() onLogout;

  const NotesTabletLayout({
    super.key,
    this.isLoading = false,
    required this.notes,
    this.selectedNote,
    required this.onLogout,
    required this.onNoteSelected,
  });

  @override
  State<NotesTabletLayout> createState() => _NotesTabletLayoutState();
}

class _NotesTabletLayoutState extends State<NotesTabletLayout> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TabletSideBar(
            isLoading: widget.isLoading,
            notes: widget.notes,
            onAddNote: () => widget.onNoteSelected(Note.empty()),
            onNoteSelected: widget.onNoteSelected,
            onLogout: widget.onLogout,
            selectedNote: widget.selectedNote,
          ),
        ),
        Expanded(
          flex: 2,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: widget.selectedNote != null
                ? EditNoteScreen(
                    key: ValueKey(widget.selectedNote?.id ?? 'new_note'),
                    note: widget.selectedNote!,
                  )
                : Center(
                    child: Text(
                      context.l10n.home_screen_empty_detail_title,
                      style: AppTextStyles.subtitle1.copyWith(
                        color: context.colorScheme.textPrimary,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class TabletSideBar extends StatelessWidget {
  final List<Note> notes;
  final bool isLoading;
  final Note? selectedNote;
  final VoidCallback onAddNote;
  final VoidCallback onLogout;
  final ValueChanged<Note> onNoteSelected;

  const TabletSideBar({
    super.key,
    required this.notes,
    required this.isLoading,
    required this.selectedNote,
    required this.onAddNote,
    required this.onLogout,
    required this.onNoteSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(right: BorderSide(color: context.colorScheme.outline)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  context.l10n.app_name,
                  style: AppTextStyles.header2.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                const Spacer(),
                AppIconButton(onTap: onAddNote, icon: Icons.add),
                AppIconButton(
                  onTap: onLogout,
                  icon: Icons.logout,
                  iconColor: context.colorScheme.alert,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: context.colorScheme.outline),
          Expanded(
            flex: 2,
            child: NoteList(
              notes: notes,
              onTap: onNoteSelected,
              selectedNote: selectedNote,
              isLoading: isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
