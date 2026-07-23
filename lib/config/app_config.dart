import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

/// App configuration and theme management
final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});

final localeProvider = StateProvider<Locale?>((ref) {
  return null; // System locale
});

final appNameProvider = Provider<String>((ref) {
  return 'LifeOS';
});

final appVersionProvider = Provider<String>((ref) {
  return '1.0.0';
});

final appBuildProvider = Provider<String>((ref) {
  return '1';
});

class AppConfig {
  static const String appName = 'LifeOS';
  static const String appVersion = '1.0.0';
  static const String appBuild = '1';
  
  static const String appTagline = 'Your Digital Memory.';
  static const String appDescription = 'Privacy-First, Local-First Personal Memory Operating System';
  
  // Security
  static const int maxPinRetries = 5;
  static const Duration pinLockoutDuration = Duration(minutes: 15);
  static const int minPinLength = 4;
  static const int maxPinLength = 8;
  
  // Storage
  static const int maxFileSize = 1024 * 1024 * 500; // 500 MB
  static const int maxTotalStorage = 1024 * 1024 * 1024 * 10; // 10 GB
  
  // Animation Durations
  static const Duration animationDurationFast = Duration(milliseconds: 200);
  static const Duration animationDurationMedium = Duration(milliseconds: 300);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);
  
  // API Timeout
  static const Duration apiTimeout = Duration(seconds: 30);
}
