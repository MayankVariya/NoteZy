import 'package:flutter/material.dart';

import 'colors.dart';

class ThemeNotifier extends InheritedWidget {
  final AppColorScheme colorScheme;

  const ThemeNotifier({
    super.key,
    required this.colorScheme,
    required super.child,
  });

  @override
  bool updateShouldNotify(ThemeNotifier oldWidget) {
    return colorScheme != oldWidget.colorScheme;
  }
}

AppColorScheme appColorSchemeOf(BuildContext context) {
  return context
      .dependOnInheritedWidgetOfExactType<ThemeNotifier>()!
      .colorScheme;
}

class AppThemeBuilder {
  static ThemeData materialThemeFromColorScheme({
    required AppColorScheme colorScheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      dividerColor: colorScheme.outline,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorScheme.primary,
        primary: colorScheme.primary,
        surface: colorScheme.surface,
        onPrimary: colorScheme.onPrimary,
        onSurface: colorScheme.textPrimary,
        outline: colorScheme.outline,
        brightness: colorScheme.brightness,
        error: colorScheme.alert,
        onError: colorScheme.onPrimary,
        surfaceContainerLow: colorScheme.containerLow,
        surfaceContainer: colorScheme.containerNormal,
        surfaceContainerHigh: colorScheme.containerHigh,
        primaryContainer: colorScheme.containerLow,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
    );
  }
}
