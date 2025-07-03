import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notezy/core/extensions/context_extension.dart';

import '../typography/typography.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextStyle? style;
  final Color? backgroundColor;
  final bool expands;
  final bool enabled;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final AppTextFieldBorderType borderType;
  final BorderColor? borderColor;
  final double borderWidth;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? errorText;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isCollapsed;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool autoFocus;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final Function(PointerDownEvent)? onTapOutside;
  final bool obscureText;

  const AppTextField({
    super.key,
    this.label,
    this.controller,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.style,
    this.backgroundColor,
    this.expands = false,
    this.enabled = true,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
    this.borderType = AppTextFieldBorderType.underline,
    this.borderColor,
    this.borderWidth = 1,
    this.textInputAction,
    this.borderRadius,
    this.hintText,
    this.hintStyle,
    this.errorText,
    this.errorStyle,
    this.contentPadding,
    this.isDense,
    this.isCollapsed,
    this.autoFocus = false,
    this.keyboardType,
    this.focusNode,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.textAlign = TextAlign.start,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return _textField(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: AppTextStyles.body2.copyWith(
            color: context.colorScheme.textDisabled,
          ),
        ),
        if (borderType == AppTextFieldBorderType.outline)
          const SizedBox(height: 12),
        _textField(context),
      ],
    );
  }

  Widget _textField(BuildContext context) => Material(
    color: Colors.transparent,
    borderRadius: borderRadius,
    child: TextField(
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      expands: expands,
      textInputAction: textInputAction,
      autofocus: autoFocus,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      textAlign: textAlign,
      style:
          style ??
          AppTextStyles.subtitle2.copyWith(
            color: context.colorScheme.textPrimary,
          ),
      onTapOutside:
          onTapOutside ??
          (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
      buildCounter:
          (
            context, {
            required currentLength,
            required isFocused,
            required maxLength,
          }) => const SizedBox(),
      maxLength: maxLength,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        isDense: isDense,
        isCollapsed: isCollapsed,
        errorText: errorText,
        errorStyle:
            errorStyle ??
            AppTextStyles.caption.copyWith(color: context.colorScheme.alert),
        hintText: hintText,
        hintStyle: hintStyle,
        fillColor: backgroundColor,
        suffixIcon: suffixIcon,
        prefixIconConstraints: prefixIconConstraints,
        filled: backgroundColor != null,
        focusedBorder: _border(context, true),
        enabledBorder: _border(context, false),
        focusedErrorBorder: _border(context, true, isError: true),
        errorBorder: _border(context, false, isError: true),
        contentPadding:
            contentPadding ??
            (borderType == AppTextFieldBorderType.outline
                ? const EdgeInsets.all(12)
                : null),
      ),
    ),
  );

  InputBorder _border(
    BuildContext context,
    bool focused, {
    bool isError = false,
  }) {
    switch (borderType) {
      case AppTextFieldBorderType.none:
        return const UnderlineInputBorder(borderSide: BorderSide.none);
      case AppTextFieldBorderType.outline:
        return OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isError
                ? context.colorScheme.alert
                : focused
                ? borderColor?.focusColor ?? context.colorScheme.primary
                : borderColor?.unFocusColor ?? context.colorScheme.outline,
            width: borderWidth,
          ),
        );
      case AppTextFieldBorderType.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: isError
                ? context.colorScheme.alert
                : focused
                ? borderColor?.focusColor ?? context.colorScheme.primary
                : borderColor?.unFocusColor ?? context.colorScheme.outline,
            width: borderWidth,
          ),
        );
    }
  }
}

enum AppTextFieldBorderType { none, outline, underline }

class BorderColor {
  Color? focusColor;
  Color? unFocusColor;

  BorderColor({this.focusColor, this.unFocusColor});
}
