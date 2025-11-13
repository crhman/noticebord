import 'package:flutter/material.dart';

/// Centralized color palette for the Noticeboard app.
class AppColors {
  AppColors._();

  /// Primary brand seed color.
  static const Color primary = Color(0xFF2563EB);
  static const Color onPrimary = Colors.white;

  /// Secondary accent color for highlights and interactive states.
  static const Color secondary = Color(0xFFF97316);
  static const Color onSecondary = Colors.white;

  /// Neutral surfaces and backgrounds.
  static const Color surface = Color(0xFFF8FAFC);
  static const Color surfaceDim = Color(0xFFE2E8F0);
  static const Color surfaceBright = Colors.white;

  /// Text colors.
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);

  /// Status colors.
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);

  /// Shadows.
  static const Color softShadow = Color(0x1A0F172A);

  /// Plain gradients.
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1D4ED8), Color(0xFF2563EB), Color(0xFF3B82F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
