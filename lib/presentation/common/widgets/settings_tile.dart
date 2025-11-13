import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconBackgroundColor,
    this.trailing,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.showChevron = true,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconBackgroundColor;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final effectiveIconBackground =
        iconBackgroundColor ?? (isDark ? const Color(0xFF1E293B) : AppColors.surfaceDim);

    final leading = icon == null
        ? null
        : Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: effectiveIconBackground,
              borderRadius: BorderRadius.circular(AppSpacing.borderRadiusSm),
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: onTap == null ? theme.iconTheme.color : AppColors.primary,
            ),
          );

    final tileContent = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (leading != null) ...[
          leading,
          const SizedBox(width: AppSpacing.md),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withOpacity(0.72),
                  ),
                ),
              ],
            ],
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: AppSpacing.md),
          trailing!,
        ] else if (showChevron) ...[
          const SizedBox(width: AppSpacing.md),
          Icon(
            Icons.chevron_right,
            color: theme.iconTheme.color?.withOpacity(0.6),
          ),
        ],
      ],
    );

    return Material(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(AppSpacing.borderRadiusLg),
      elevation: isDark ? 0 : 1,
      shadowColor: AppColors.softShadow,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.borderRadiusLg),
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: tileContent,
        ),
      ),
    );
  }
}

class SettingsSwitchTile extends StatelessWidget {
  const SettingsSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.icon,
    this.iconBackgroundColor,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData? icon;
  final Color? iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SettingsTile(
      title: title,
      subtitle: subtitle,
      icon: icon,
      iconBackgroundColor: iconBackgroundColor,
      showChevron: false,
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primary,
      ),
    );
  }
}

