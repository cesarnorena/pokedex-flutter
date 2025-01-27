import 'package:flutter/material.dart';

ColorScheme buildColorScheme() {
  return const ColorScheme.light(
    primary: Colors.red,
    onPrimary: Colors.white,
    secondary: Colors.indigo,
    onSecondary: Colors.white,
    tertiary: Colors.amber,
    onTertiary: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );
}

ThemeData buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: buildColorScheme(),
  );
}
