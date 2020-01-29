import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'resources/AppLocalizations.dart';
import 'screens/PokemonListScreen.dart';
import 'screens/PokemonDetailScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const route = '/';

  final routes = {
    MyApp.route: (ctx) => PokemonListScreen(),
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

  final _appTheme = ThemeData(
    primarySwatch: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _appTheme,
      initialRoute: MyApp.route,
      routes: routes,
      supportedLocales: _supportedLocales,
      localizationsDelegates: _localizationDelegates,
    );
  }
}
