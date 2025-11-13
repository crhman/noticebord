import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  static const String _fontFamily = 'Inter';

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: _baseStyle.copyWith(
      fontSize: 54,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: _baseStyle.copyWith(
      fontSize: 44,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: _baseStyle.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: _baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: _baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: _baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: _baseStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
    titleMedium: _baseStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
    titleSmall: _baseStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
    bodyLarge: _baseStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: _baseStyle.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
    bodySmall: _baseStyle.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
    labelLarge: _baseStyle.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
    labelMedium: _baseStyle.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
    labelSmall: _baseStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: _darkBaseStyle.copyWith(
      fontSize: 54,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: _darkBaseStyle.copyWith(
      fontSize: 44,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: _darkBaseStyle.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: _darkBaseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: _darkBaseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: _darkBaseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: _darkBaseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: _darkBaseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: _darkBaseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: _darkBaseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: _darkBaseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: _darkBaseStyle.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: _darkBaseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: _darkBaseStyle.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: _darkBaseStyle.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
  );

  static const TextStyle _baseStyle = TextStyle(
    color: AppColors.textPrimary,
    fontFamily: _fontFamily,
    letterSpacing: 0.1,
  );

  static const TextStyle _darkBaseStyle = TextStyle(
    color: Colors.white,
    fontFamily: _fontFamily,
    letterSpacing: 0.1,
  );
}
