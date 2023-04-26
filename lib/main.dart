import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'screens/details/PokemonDetailScreen.dart';
import 'screens/list/PokemonListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _routes = {
    PokemonListScreen.route: (ctx) => PokemonListScreen(),
    PokemonDetailScreen.route: (ctx) => PokemonDetailScreen(),
  };

  final _appTheme = ThemeData(primarySwatch: Colors.red);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _appTheme,
      initialRoute: PokemonListScreen.route,
      routes: _routes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
