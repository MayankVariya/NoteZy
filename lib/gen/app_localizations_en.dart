// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'NoteZy';

  @override
  String get sign_in_screen_title => 'Welcome Back!';

  @override
  String get sign_in_screen_email_label => 'Email';

  @override
  String get sign_in_screen_email_hint => 'example@gmail.com';

  @override
  String get sign_in_screen_password_label => 'Password';

  @override
  String get sign_in_screen_password_hint => '******';

  @override
  String get sign_in_screen_button => 'Sign In';

  @override
  String get sign_in_screen_forgot_password => 'Forgot Password?';

  @override
  String get sign_in_screen_sign_up_description => 'Don\'t have an account? ';

  @override
  String get sign_up_title => 'Sign Up';

  @override
  String get sign_up_screen_title => 'Create an Account';

  @override
  String get sign_up_screen_sign_in_description => 'Already have an account? ';

  @override
  String get sign_up_screen_name_label => 'Name';

  @override
  String get sign_up_screen_name_hint => 'John Doe';

  @override
  String get edit_note_screen_title => 'Edit Note';

  @override
  String get edit_note_screen_add_title => 'Add Note';

  @override
  String get edit_note_screen_note => 'Note';

  @override
  String get edit_note_screen_note_title => 'Title';

  @override
  String get home_screen_empty_detail_title => 'Select or create a note.';

  @override
  String get home_screen_empty_notes_title => 'No Notes';
}
