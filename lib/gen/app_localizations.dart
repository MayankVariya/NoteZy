import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'NoteZy'**
  String get app_name;

  /// No description provided for @sign_in_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get sign_in_screen_title;

  /// No description provided for @sign_in_screen_email_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get sign_in_screen_email_label;

  /// No description provided for @sign_in_screen_email_hint.
  ///
  /// In en, this message translates to:
  /// **'example@gmail.com'**
  String get sign_in_screen_email_hint;

  /// No description provided for @sign_in_screen_password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get sign_in_screen_password_label;

  /// No description provided for @sign_in_screen_password_hint.
  ///
  /// In en, this message translates to:
  /// **'******'**
  String get sign_in_screen_password_hint;

  /// No description provided for @sign_in_screen_button.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in_screen_button;

  /// No description provided for @sign_in_screen_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get sign_in_screen_forgot_password;

  /// No description provided for @sign_in_screen_sign_up_description.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get sign_in_screen_sign_up_description;

  /// No description provided for @sign_up_title.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up_title;

  /// No description provided for @sign_up_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get sign_up_screen_title;

  /// No description provided for @sign_up_screen_sign_in_description.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get sign_up_screen_sign_in_description;

  /// No description provided for @sign_up_screen_name_label.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sign_up_screen_name_label;

  /// No description provided for @sign_up_screen_name_hint.
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get sign_up_screen_name_hint;

  /// No description provided for @edit_note_screen_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Note'**
  String get edit_note_screen_title;

  /// No description provided for @edit_note_screen_add_title.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get edit_note_screen_add_title;

  /// No description provided for @edit_note_screen_note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get edit_note_screen_note;

  /// No description provided for @edit_note_screen_note_title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get edit_note_screen_note_title;

  /// No description provided for @home_screen_empty_detail_title.
  ///
  /// In en, this message translates to:
  /// **'Select or create a note.'**
  String get home_screen_empty_detail_title;

  /// No description provided for @home_screen_empty_notes_title.
  ///
  /// In en, this message translates to:
  /// **'No Notes'**
  String get home_screen_empty_notes_title;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
