import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'screens/details/pokemon_detail_screen.dart';
import 'screens/list/pokemon_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _routes = {
    PokemonListScreen.route: (ctx) => const PokemonListScreen(),
    PokemonDetailScreen.route: (ctx) => const PokemonDetailScreen(),
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
