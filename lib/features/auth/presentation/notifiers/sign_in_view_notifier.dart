import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notezy/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/di/providers.dart';

part 'sign_in_view_notifier.freezed.dart';

final signInViewModelProvider =
    StateNotifierProvider.autoDispose<SignInViewNotifier, SignInState>(
      (ref) => SignInViewNotifier(ref.read(authRepositoryProvider)),
    );

class SignInViewNotifier extends StateNotifier<SignInState> {
  final AuthRepository _authRepository;

  SignInViewNotifier(this._authRepository)
    : super(
        SignInState(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
        ),
      );

  void showPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void onChanged(String value) {
    if (value.isEmpty) return;

    state = state.copyWith(
      enableBtn:
          state.emailController.text.isNotEmpty &&
          state.passwordController.text.isNotEmpty &&
          state.passwordController.text.length >= 6,
    );
  }

  void login() async {
    try {
      state = state.copyWith(loading: true);
      await _authRepository.login(
        state.emailController.text,
        state.passwordController.text,
      );
      state = state.copyWith(success: true, loading: false);
    } catch (e) {
      state = state.copyWith(error: e, loading: false);
    }
  }
}

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    @Default(false) bool loading,
    @Default(false) bool success,
    Object? error,
    @Default(false) bool showPassword,
    @Default(false) bool enableBtn,
  }) = _SignInState;
}
