import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokedex_flutter/core/design_system/theme.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_screen.dart';
import 'package:pokedex_flutter/shared/routes/application_routes.dart';

class Application extends StatelessWidget {
  final _routes = buildRoutes();

  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(),
      initialRoute: PokemonListScreen.route,
      routes: _routes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
