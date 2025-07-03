import 'package:flutter/material.dart';
import 'package:notezy/core/extensions/context_extension.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;

  const AppIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onTap,
      icon: Icon(icon, color: iconColor ?? context.colorScheme.textPrimary),
      style: IconButton.styleFrom(
        backgroundColor: context.colorScheme.containerNormal,
      ),
    );
  }
}
