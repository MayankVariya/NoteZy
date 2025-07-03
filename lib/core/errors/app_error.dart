import 'dart:io';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'l10n_error_codes.dart';

class AppError implements Exception {
  final String? message;
  final String? l10nCode;
  final int? statusCode;

  const AppError({this.message, this.statusCode, this.l10nCode});

  @override
  String toString() {
    return '$runtimeType{message: $message, code: $statusCode, l10nCode: $l10nCode}';
  }

  factory AppError.fromError(Object error) {
    if (error is AppError) {
      return error;
    }

    if (error is FirebaseAuthException) {
      return FirebaseAuthError.from(error);
    }

    if (error is SocketException ||
        (error is PlatformException && error.code == 'network_error')) {
      return const NoConnectionError();
    }

    return SomethingWentWrongError(message: error.toString());
  }
}

class FirebaseAuthError extends AppError {
  const FirebaseAuthError({super.message, super.statusCode, super.l10nCode});

  factory FirebaseAuthError.from(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const InvalidEmailError();
      case 'user-disabled':
        return const UserDisabledError();
      case 'user-not-found':
        return const UserNotFoundError();
      case 'wrong-password':
        return const WrongPasswordError();
      case 'email-already-in-use':
        return const EmailAlreadyInUseError();
      case 'operation-not-allowed':
        return const OperationNotAllowedError();
      case 'weak-password':
        return const WeakPasswordError();
      case 'too-many-requests':
        return const TooManyRequestsError();
      default:
        return FirebaseAuthError(
          message: e.message ?? 'Unknown Firebase Auth error.',
          l10nCode: AppErrorL10nCodes.firebaseUnknownError,
        );
    }
  }
}

class InvalidEmailError extends FirebaseAuthError {
  const InvalidEmailError()
    : super(
        l10nCode: AppErrorL10nCodes.invalidEmailError,
        message: "The email address is badly formatted.",
      );
}

class UserDisabledError extends FirebaseAuthError {
  const UserDisabledError()
    : super(
        l10nCode: AppErrorL10nCodes.userDisabledError,
        message: "This user has been disabled.",
      );
}

class UserNotFoundError extends FirebaseAuthError {
  const UserNotFoundError()
    : super(
        l10nCode: AppErrorL10nCodes.userNotFoundError,
        message: "No user found for the given email.",
      );
}

class WrongPasswordError extends FirebaseAuthError {
  const WrongPasswordError()
    : super(
        l10nCode: AppErrorL10nCodes.wrongPasswordError,
        message: "Incorrect password.",
      );
}

class EmailAlreadyInUseError extends FirebaseAuthError {
  const EmailAlreadyInUseError()
    : super(
        l10nCode: AppErrorL10nCodes.emailAlreadyInUseError,
        message: "Email already in use.",
      );
}

class OperationNotAllowedError extends FirebaseAuthError {
  const OperationNotAllowedError()
    : super(
        l10nCode: AppErrorL10nCodes.operationNotAllowedError,
        message: "This operation is not allowed.",
      );
}

class WeakPasswordError extends FirebaseAuthError {
  const WeakPasswordError()
    : super(
        l10nCode: AppErrorL10nCodes.weakPasswordError,
        message: "Password is too weak.",
      );
}

class TooManyRequestsError extends FirebaseAuthError {
  const TooManyRequestsError()
    : super(
        l10nCode: AppErrorL10nCodes.tooManyRequestsError,
        message: "Too many requests. Try again later.",
      );
}

class NoConnectionError extends AppError {
  const NoConnectionError()
    : super(
        l10nCode: AppErrorL10nCodes.noInternetConnectionError,
        message: "No internet connection. Please check your network.",
      );
}

class SomethingWentWrongError extends AppError {
  const SomethingWentWrongError({super.message, super.statusCode})
    : super(l10nCode: AppErrorL10nCodes.somethingWentWrongError);
}
