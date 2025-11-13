import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppSectionCard extends StatelessWidget {
  const AppSectionCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(20),
    this.gradient,
    this.trailing,
    this.leading,
    this.title,
    this.subtitle,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Gradient? gradient;
  final Widget? trailing;
  final Widget? leading;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null || subtitle != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (leading != null) ...[
                  leading!,
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        Text(
                          title!,
                          style: theme.textTheme.titleLarge,
                        ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle!,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (trailing != null) ...[
                  const SizedBox(width: 12),
                  trailing!,
                ],
              ],
            ),
          ),
        child,
      ],
    );

    final card = InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: gradient,
          color: gradient == null
              ? theme.cardTheme.color
              : null,
          boxShadow: [
            if (theme.brightness == Brightness.light)
              const BoxShadow(
                color: AppColors.softShadow,
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
          ],
          border: Border.all(
            color: theme.brightness == Brightness.light
                ? Colors.white
                : Colors.white.withOpacity(0.05),
          ),
        ),
        padding: padding,
        child: content,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: card,
    );
  }
}

