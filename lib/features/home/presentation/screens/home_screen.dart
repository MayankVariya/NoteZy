import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notezy/core/extensions/context_extension.dart';
import 'package:notezy/shared/widgets/icon_button.dart';

import '../../../../navigation/routes.dart';
import '../../../../shared/typography/typography.dart' show AppTextStyles;
import '../../../../shared/widgets/app_toast.dart';
import '../notifiers/home_view_notifier.dart';
import '../widgets/notes_mobile_layout.dart';
import '../widgets/notes_tablet_layout.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late HomeViewNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ref.read(homeViewNotifierProvider.notifier);
  }

  void _observeError() {
    ref.listen(homeViewNotifierProvider.select((s) => s.error), (prev, next) {
      if (next != null) showToast(context, next);
    });
  }

  void _observeLoggedOut() {
    ref.listen(homeViewNotifierProvider.select((s) => s.loggedOut), (
      prev,
      next,
    ) {
      if (next) SignInRoute().go(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    _observeError();
    _observeLoggedOut();

    final isTablet = context.isTablet;
    final state = ref.watch(homeViewNotifierProvider);
    final selectedNote = ref.watch(selectedNoteProvider);

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: isTablet
          ? null
          : AppBar(
              elevation: 1,
              actionsPadding: const EdgeInsets.only(right: 16),
              shadowColor: context.colorScheme.outline,
              title: Text(
                context.l10n.app_name,
                style: AppTextStyles.header2.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              actions: [
                AppIconButton(
                  onTap: _notifier.logout,
                  icon: Icons.logout,
                  iconColor: context.colorScheme.alert,
                ),
              ],
            ),
      floatingActionButton: isTablet
          ? null
          : FloatingActionButton(
              backgroundColor: context.colorScheme.primary,
              onPressed: () => EditNoteRoute().push(context),
              child: const Icon(Icons.add),
            ),
      body: SafeArea(
        child: isTablet
            ? NotesTabletLayout(
                notes: state.notes,
                isLoading: state.loading,
                selectedNote: selectedNote,
                onNoteSelected: (note) =>
                    ref.read(selectedNoteProvider.notifier).state = note,
                onLogout: () {
                  ref.read(selectedNoteProvider.notifier).state = null;
                  _notifier.logout();
                },
              )
            : NotesMobileLayout(notes: state.notes, isLoading: state.loading),
      ),
    );
  }
}
