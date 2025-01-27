import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';
import 'package:pokedex_flutter/screens/details/pokemon_detail_screen.dart';

class PokemonDetailProvider extends StatelessWidget {
  const PokemonDetailProvider({super.key});

  @override
  Widget build(BuildContext context) {
    PokedexEntry pokemon =
        ModalRoute.of(context)?.settings.arguments as PokedexEntry;

    return PokemonDetailScreen(pokemon);
  }
}
