import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/AppLocalizations.dart';
import 'screens/details/PokemonDetailScreen.dart';
import 'screens/list/PokemonListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _routes = {
    PokemonListScreen.route: (ctx) => PokemonListScreen(),
    PokemonDetailScreen.route: (ctx) => PokemonDetailScreen(),
  };

  final _supportedLocales = [
    const Locale("en"),
    const Locale("es"),
  ];

  final _localizationDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  final _appTheme = ThemeData(primarySwatch: Colors.red);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _appTheme,
      initialRoute: PokemonListScreen.route,
      routes: _routes,
      supportedLocales: _supportedLocales,
      localizationsDelegates: _localizationDelegates,
    );
  }
}
