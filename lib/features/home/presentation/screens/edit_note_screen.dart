import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notezy/core/extensions/context_extension.dart';
import 'package:notezy/shared/typography/typography.dart';
import 'package:notezy/shared/widgets/app_text_field.dart';
import 'package:notezy/shared/widgets/app_toast.dart';
import 'package:notezy/shared/widgets/icon_button.dart';

import '../../domain/models/note.dart';
import '../notifiers/home_view_notifier.dart';
import '../notifiers/edit_note_view_notifier.dart';

class EditNoteScreen extends ConsumerStatefulWidget {
  final Note? note;

  const EditNoteScreen({super.key, this.note});

  @override
  ConsumerState<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends ConsumerState<EditNoteScreen> {
  late final EditNoteViewNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ref.read(editNoteViewNotifierProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifier.setData(widget.note);
    });
  }

  void _observeError() {
    ref.listen(editNoteViewNotifierProvider.select((s) => s.error), (_, next) {
      if (next != null) showToast(context, next);
    });
  }

  void _observePop() {
    ref.listen(editNoteViewNotifierProvider.select((s) => s.pop), (_, next) {
      if (next && context.mounted) {
        if (context.isTablet) {
          _onClearNote();
        } else {
          context.pop();
        }
      }
    });
  }

  void _onClearNote() {
    ref.read(selectedNoteProvider.notifier).state = null;
  }

  @override
  Widget build(BuildContext context) {
    _observeError();
    _observePop();

    final isTablet = context.isTablet;
    final state = ref.watch(editNoteViewNotifierProvider);

    final isEditMode =
        widget.note != null && (widget.note?.title.trim().isNotEmpty ?? false);

    final title = Text(
      isEditMode
          ? context.l10n.edit_note_screen_title
          : context.l10n.edit_note_screen_add_title,
      style: AppTextStyles.header2.copyWith(
        color: context.colorScheme.textPrimary,
      ),
    );

    final actions = [
      if (state.enabled && !state.loading)
        AppIconButton(onTap: _notifier.saveNote, icon: Icons.check),
      if (state.loading)
        const Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      if (isEditMode)
        AppIconButton(
          onTap: () {
            _onClearNote();
            _notifier.deleteNote();
          },
          icon: Icons.delete,
          iconColor: context.colorScheme.alert,
        ),
    ];

    final form = SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppTextField(
              controller: state.titleController,
              label: context.l10n.edit_note_screen_note_title,
              maxLines: 1,
              borderType: AppTextFieldBorderType.outline,
              onChanged: _notifier.onChanged,
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: state.noteController,
              label: context.l10n.edit_note_screen_note,
              maxLines: null,
              minLines: 8,
              borderType: AppTextFieldBorderType.outline,
              onChanged: _notifier.onChanged,
            ),
          ],
        ),
      ),
    );

    return isTablet
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    AppIconButton(onTap: _onClearNote, icon: Icons.close),
                    const SizedBox(width: 16),
                    title,
                    const Spacer(),
                    ...actions,
                  ],
                ),
              ),
              Divider(height: 1, color: context.colorScheme.outline),
              Expanded(child: form),
            ],
          )
        : Scaffold(
            backgroundColor: context.colorScheme.surface,
            appBar: AppBar(
              title: title,
              actions: actions,
              elevation: 1,
              actionsPadding: const EdgeInsets.only(right: 16),
              shadowColor: context.colorScheme.outline,
            ),
            body: SafeArea(child: form),
          );
  }
}
