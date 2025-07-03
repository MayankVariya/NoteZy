import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notezy/core/extensions/context_extension.dart';
import 'package:notezy/core/storage/app_preferences.dart';
import 'package:notezy/shared/theme/builder.dart';
import 'package:notezy/shared/theme/colors.dart';

import 'gen/app_localizations.dart';
import 'navigation/routes.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late GoRouter _router;

  String _configureInitialRoute() {
    if (!ref.read(hasAuth)) {
      return AppRoutes.signIn;
    } else {
      return AppRoutes.home;
    }
  }

  @override
  void initState() {
    _router = GoRouter(
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: $appRoutes,
      initialLocation: _configureInitialRoute(),
      redirect: (context, state) {
        return null;
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.systemThemeIsDark
        ? appColorSchemeDark
        : appColorSchemeLight;

    return ThemeNotifier(
      colorScheme: colorScheme,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => context.l10n.app_name,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _router,
        theme: AppThemeBuilder.materialThemeFromColorScheme(
          colorScheme: colorScheme,
        ),
      ),
    );
  }
}
