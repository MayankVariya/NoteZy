import 'package:flutter/cupertino.dart';

import '../../gen/app_localizations.dart';
import '../../shared/theme/builder.dart';
import '../../shared/theme/colors.dart' hide appColorSchemeOf;

extension BuildContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  AppColorScheme get colorScheme => appColorSchemeOf(this);

  Brightness get brightness => MediaQuery.platformBrightnessOf(this);

  bool get systemThemeIsDark => brightness == Brightness.dark;

  Size get mediaQuerySize => MediaQuery.sizeOf(this);

  bool get isTablet => MediaQuery.of(this).size.shortestSide >= 600;
}
