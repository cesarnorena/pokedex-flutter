import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/Entities/pokedex_entry.dart';

class PokemonListWidget extends StatelessWidget {
  final List<PokedexEntry> _pokemonList;
  final void Function(int index) _onItemClick;

  const PokemonListWidget(
    this._pokemonList,
    this._onItemClick, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _pokemonList.length,
      itemBuilder: (ctx, idx) {
        return InkWell(
          onTap: () => _onItemClick(idx),
          child: _PokemonListItemWidget(_pokemonList[idx]),
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
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Image.network(
              pokemon.imageUrl,
              width: 56,
              height: 56,
              errorBuilder: (ctx, _, __) {
                return const SizedBox(
                  width: 56,
                  height: 56,
                  child: Icon(Icons.image_not_supported),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                pokemon.specie.capitalizedName,
                style: const TextStyle(fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }
}
