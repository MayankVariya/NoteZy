import 'package:flutter/material.dart';
import 'package:notezy/core/errors/app_error.dart';

void showToast(BuildContext context, Object error) {
  final appError = AppError.fromError(error);

  final snackBar = SnackBar(
    content: Text(appError.message ?? 'Something went wrong'),
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
