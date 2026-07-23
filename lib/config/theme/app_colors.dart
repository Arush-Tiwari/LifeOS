import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryLight = Color(0xFFE0E7FF);
  static const Color primaryDark = Color(0xFF4F46E5);

  // Accent Colors
  static const Color accent = Color(0xFF10B981); // Emerald
  static const Color accentLight = Color(0xFFD1FAE5);
  static const Color accentDark = Color(0xFF059669);

  // Semantic Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Light Mode
  static const Color lightBackground = Color(0xFFFAFAFA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightInputBackground = Color(0xFFF3F4F6);
  static const Color lightBorder = Color(0xFFE5E7EB);
  static const Color lightText = Color(0xFFF3F4F6);
  static const Color lightTextSecondary = Color(0xFF9CA3AF);
  static const Color darkText = Color(0xFF111827);
  static const Color darkTextSecondary = Color(0xFF6B7280);

  // Dark Mode
  static const Color darkBackground = Color(0xFF0F172A); // Slate-950
  static const Color darkSurface = Color(0xFF1E293B); // Slate-900
  static const Color darkInputBackground = Color(0xFF334155); // Slate-700
  static const Color darkBorder = Color(0xFF475569); // Slate-600
  static const Color darkTextSecondary = Color(0xFF94A3B8); // Slate-400

  // AMOLED Dark Mode
  static const Color amoledBackground = Color(0xFF000000);
  static const Color amoledSurface = Color(0xFF0A0A0A);
  static const Color amoledBorder = Color(0xFF1A1A1A);

  // Glassmorphism
  static const Color glassLight = Color(0xFFFFFFFF);
  static const Color glassDark = Color(0xFF1E293B);

  // Gradients
  static const List<Color> gradientPrimary = [
    Color(0xFF6366F1),
    Color(0xFF8B5CF6),
  ];

  static const List<Color> gradientAccent = [
    Color(0xFF10B981),
    Color(0xFF14B8A6),
  ];

  static const List<Color> gradientWarn = [
    Color(0xFFF59E0B),
    Color(0xFFEF4444),
  ];
}
