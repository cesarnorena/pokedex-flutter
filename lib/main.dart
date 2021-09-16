import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/AppLocalizations.dart';
import 'screens/details/PokemonDetailScreen.dart';
import 'screens/list/PokemonListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const route = '/';

  final _routes = {
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
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _appTheme,
      initialRoute: MyApp.route,
      routes: _routes,
      supportedLocales: _supportedLocales,
      localizationsDelegates: _localizationDelegates,
    );
  }
}
