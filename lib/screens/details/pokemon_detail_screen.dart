import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';

class PokemonDetailScreen extends StatelessWidget {
  static const route = 'pokemons/detail';

  const PokemonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PokedexEntry pokemon =
        ModalRoute.of(context)?.settings.arguments as PokedexEntry;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.specie.capitalizedName,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24, left: 40, right: 40),
            child: Image.network(
              pokemon.imageUrl,
              errorBuilder: (ctx, _, __) {
                return const Icon(Icons.image_not_supported);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              pokemon.specie.capitalizedName,
              style: const TextStyle(fontSize: 28),
            ),
          )
        ],
      ),
    );
  }
}
