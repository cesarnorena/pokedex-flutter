import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Colors.red;
  static const onPrimary = Colors.white;
  static const secondary = Colors.indigo;
  static const onSecondary = Colors.white;
  static const tertiary = Colors.amber;
  static const onTertiary = Colors.black;
  static const surface = Colors.white;
  static const onSurface = Colors.black;

  static const darkSurface = Color(0xFF121212);
  static const darkOnSurface = Colors.white;
}

ColorScheme buildColorScheme({Brightness brightness = Brightness.light}) {
  if (brightness == Brightness.dark) {
    return const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkOnSurface,
    );
  }

  return const ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiary,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
  );
}
