import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notezy/core/extensions/context_extension.dart';
import 'package:notezy/features/auth/presentation/notifiers/sign_in_view_notifier.dart';
import 'package:notezy/shared/widgets/app_toast.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../navigation/routes.dart';
import '../../../../shared/typography/typography.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/primary_button.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late SignInViewNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ref.read(signInViewModelProvider.notifier);
  }

  void _observeSuccess() {
    ref.listen(signInViewModelProvider.select((value) => value.success), (
      previous,
      next,
    ) {
      if (next) HomeRoute().go(context);
    });
  }

  void _observeError() {
    ref.listen(signInViewModelProvider.select((value) => value.error), (
      previous,
      next,
    ) {
      if (next != null) {
        showToast(context, next);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _observeSuccess();
    _observeError();

    final state = ref.watch(signInViewModelProvider);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SafeArea(
              child: SizedBox(
                width: context.isTablet
                    ? context.mediaQuerySize.width / 2
                    : double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.icApp.path,
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      context.l10n.sign_in_screen_title,
                      style: AppTextStyles.header2.copyWith(
                        color: context.colorScheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      controller: state.emailController,
                      label: context.l10n.sign_in_screen_email_label,
                      hintText: context.l10n.sign_in_screen_email_hint,
                      keyboardType: TextInputType.emailAddress,
                      hintStyle: AppTextStyles.subtitle1.copyWith(
                        color: context.colorScheme.textDisabled,
                      ),
                      borderType: AppTextFieldBorderType.outline,
                      backgroundColor: context.colorScheme.containerLow,
                      onChanged: _notifier.onChanged,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: state.passwordController,
                      label: context.l10n.sign_in_screen_password_label,
                      hintText: context.l10n.sign_in_screen_password_hint,
                      keyboardType: TextInputType.number,
                      hintStyle: AppTextStyles.subtitle1.copyWith(
                        color: context.colorScheme.textDisabled,
                      ),
                      borderType: AppTextFieldBorderType.outline,
                      backgroundColor: context.colorScheme.containerLow,
                      obscureText: !state.showPassword,
                      suffixIcon: GestureDetector(
                        onTap: _notifier.showPassword,
                        child: Icon(
                          state.showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      onChanged: _notifier.onChanged,
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      onPressed: _notifier.login,
                      expanded: true,
                      enabled: state.enableBtn && !state.loading,
                      loading: state.loading,
                      text: context.l10n.sign_in_screen_button,
                    ),
                    const SizedBox(height: 40),
                    Text.rich(
                      TextSpan(
                        text: context.l10n.sign_in_screen_sign_up_description,
                        style: AppTextStyles.subtitle1.copyWith(
                          color: context.colorScheme.textSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: context.l10n.sign_up_title,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => SignUpRoute().go(context),
                            style: AppTextStyles.subtitle1.copyWith(
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
