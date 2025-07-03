import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notezy/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:notezy/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:notezy/features/home/presentation/home_screen.dart';

import '../features/home/data/models/note.dart';
import '../features/home/presentation/edit/edit_note_screen.dart';

part 'routes.g.dart';

class AppRoutes {
  static const home = '/home';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const editNote = '/edit-note';
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedGoRoute<HomeRoute>(path: AppRoutes.home)
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<SignInRoute>(path: AppRoutes.signIn)
class SignInRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}

@TypedGoRoute<SignUpRoute>(path: AppRoutes.signUp)
class SignUpRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}

@TypedGoRoute<EditNoteRoute>(path: AppRoutes.editNote)
class EditNoteRoute extends GoRouteData {
  final Note? $extra;

  EditNoteRoute({this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return EditNoteScreen(note: $extra);
  }
}
