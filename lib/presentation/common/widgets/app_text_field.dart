import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final labelWidget = label != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label!,
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.textTheme.titleSmall?.color?.withOpacity(0.8),
              ),
            ),
          )
        : const SizedBox.shrink();

    final field = TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLines: obscureText ? 1 : maxLines,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelWidget,
        field,
      ],
    );
  }
}

