import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';

class PokemonDetailScreen extends StatelessWidget {
  static const route = 'pokemons/detail';

  final PokedexEntry pokemon;

  const PokemonDetailScreen(
    this.pokemon, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.specie.capitalizedName,
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Center(
                child: Image.network(
                  width: 224.0,
                  height: 224.0,
                  pokemon.imageUrl,
                  errorBuilder: (_, __, ___) {
                    return const Icon(Icons.image_not_supported);
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                pokemon.formattedId,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                pokemon.specie.capitalizedName,
                style: textTheme.headlineMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
