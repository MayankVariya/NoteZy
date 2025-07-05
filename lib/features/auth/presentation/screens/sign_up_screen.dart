import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notezy/core/extensions/context_extension.dart';
import 'package:notezy/navigation/routes.dart';
import 'package:notezy/shared/widgets/app_toast.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../shared/typography/typography.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../notifiers/sign_up_view_notifier.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late SignUpViewNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ref.read(signUpViewModelProvider.notifier);
  }

  void _observeSuccess() {
    ref.listen(signUpViewModelProvider.select((value) => value.success), (
      previous,
      next,
    ) {
      if (next) HomeRoute().go(context);
    });
  }

  void _observeError() {
    ref.listen(signUpViewModelProvider.select((value) => value.error), (
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

    final state = ref.watch(signUpViewModelProvider);

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.isTablet ? 600 : double.infinity,
          ),
          child: ListView(
            padding: const EdgeInsets.all(24),
            shrinkWrap: true,
            children: [
              Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.icApp.path,
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    context.l10n.sign_up_screen_title,
                    style: AppTextStyles.header2.copyWith(
                      color: context.colorScheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AppTextField(
                    controller: state.nameController,
                    label: context.l10n.sign_up_screen_name_label,
                    hintText: context.l10n.sign_up_screen_name_hint,
                    keyboardType: TextInputType.text,
                    hintStyle: AppTextStyles.subtitle1.copyWith(
                      color: context.colorScheme.textDisabled,
                    ),
                    borderType: AppTextFieldBorderType.outline,
                    backgroundColor: context.colorScheme.containerLow,
                    onChanged: _notifier.onChanged,
                  ),
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
                  AppTextField(
                    controller: state.passwordController,
                    label: context.l10n.sign_in_screen_password_label,
                    hintText: context.l10n.sign_in_screen_password_hint,
                    keyboardType: TextInputType.number,
                    obscureText: !state.showPassword,
                    hintStyle: AppTextStyles.subtitle1.copyWith(
                      color: context.colorScheme.textDisabled,
                    ),
                    borderType: AppTextFieldBorderType.outline,
                    backgroundColor: context.colorScheme.containerLow,
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
                  const SizedBox(height: 8),
                  PrimaryButton(
                    onPressed: _notifier.signup,
                    expanded: true,
                    enabled: state.enableBtn && !state.loading,
                    loading: state.loading,
                    text: context.l10n.sign_up_title,
                  ),
                  const SizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text: context.l10n.sign_up_screen_sign_in_description,
                      style: AppTextStyles.subtitle1.copyWith(
                        color: context.colorScheme.textSecondary,
                      ),
                      children: [
                        TextSpan(
                          text: context.l10n.sign_in_screen_button,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => SignInRoute().go(context),
                          style: AppTextStyles.subtitle1.copyWith(
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
