import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notezy/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/di/providers.dart';

part 'sign_up_view_notifier.freezed.dart';

final signUpViewModelProvider =
    StateNotifierProvider.autoDispose<SignUpViewNotifier, SignUpState>(
      (ref) => SignUpViewNotifier(ref.read(authRepositoryProvider)),
    );

class SignUpViewNotifier extends StateNotifier<SignUpState> {
  final AuthRepository _authRepository;

  SignUpViewNotifier(this._authRepository)
    : super(
        SignUpState(
          nameController: TextEditingController(),
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
          state.passwordController.text.length >= 6 &&
          state.nameController.text.isNotEmpty,
    );
  }

  void signup() async {
    try {
      state = state.copyWith(loading: true);
      final email = state.emailController.text.trim();
      final pass = state.passwordController.text.trim();
      final name = state.nameController.text.trim();

      await _authRepository.signup(email: email, pass: pass, name: name);
      state = state.copyWith(success: true, loading: false);
    } catch (e) {
      state = state.copyWith(error: e, loading: false);
    }
  }
}

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    @Default(false) bool loading,
    @Default(false) bool success,
    Object? error,
    @Default(false) bool showPassword,
    @Default(false) bool enableBtn,
  }) = _SignUpState;
}
