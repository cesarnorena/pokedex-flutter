import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/design_system/colors.dart';

ThemeData buildTheme({Brightness brightness = Brightness.light}) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: buildColorScheme(brightness: brightness),
  );
}
