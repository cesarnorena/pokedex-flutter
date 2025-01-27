import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';

class PokemonListWidget extends StatelessWidget {
  final List<PokedexEntry> entries;
  final void Function(int index) onItemClick;

  const PokemonListWidget({
    super.key,
    required this.entries,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => onItemClick(index),
          child: _PokemonListItemWidget(entries[index]),
        );
      },
    );
  }
}

class _PokemonListItemWidget extends StatelessWidget {
  final PokedexEntry pokemon;

  const _PokemonListItemWidget(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme) = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              pokemon.imageUrl,
              width: 56.0,
              height: 56.0,
              errorBuilder: (_, __, ___) {
                return const SizedBox(
                  width: 56.0,
                  height: 56.0,
                  child: Icon(Icons.image_not_supported),
                );
              },
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.formattedId,
                  style: textTheme.titleSmall,
                ),
                Text(
                  pokemon.specie.capitalizedName,
                  style: textTheme.titleLarge,
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
