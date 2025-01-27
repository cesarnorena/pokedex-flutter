import 'package:flutter/material.dart';
import 'package:pokedex_flutter/screens/details/pokemon_detail_screen.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_provider.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_screen.dart';

Map<String, WidgetBuilder> buildRoutes() {
  return {
    PokemonListScreen.route: (_) => const PokemonListProvider(),
    PokemonDetailScreen.route: (_) => const PokemonDetailScreen(),
  };
}
