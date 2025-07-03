import 'package:flutter/material.dart';
import 'package:notezy/core/extensions/context_extension.dart';

import '../typography/typography.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final bool expanded;
  final double borderRadius;
  final VoidCallback onPressed;
  final bool enabled;
  final bool loading;

  const PrimaryButton({
    super.key,
    this.text = '',
    this.child,
    this.enabled = true,
    this.borderRadius = 12,
    this.expanded = false,
    this.loading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: enabled ? onPressed : null,
      style: FilledButton.styleFrom(
        disabledBackgroundColor: context.colorScheme.primary.withValues(
          alpha: 0.12,
        ),
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child:
          child ??
          Row(
            mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loading)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(color: Colors.white),
                  ),
                ),
              Text(
                text,
                style: AppTextStyles.button.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
    );
  }
}
