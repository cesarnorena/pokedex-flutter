import 'package:flutter/material.dart';

ColorScheme buildColorScheme() {
  return const ColorScheme.light(
    primary: Colors.red,
  );
}

ThemeData buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: buildColorScheme(),
  );
}
