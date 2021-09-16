import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex_flutter/data/Entities/PokedexEntry.dart';

class PokemonListWidget extends StatelessWidget {
  PokemonListWidget(this._pokemonList, this._onItemClick);

  final List<PokedexEntry> _pokemonList;

  final void Function(int index) _onItemClick;

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
  const _PokemonListItemWidget(this.pokemon);

  final PokedexEntry pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Image.network(
              pokemon.imageUrl,
              width: 56,
              height: 56,
              errorBuilder: (ctx, _, __) {
                return Container(
                  child: Icon(Icons.image_not_supported),
                  width: 56,
                  height: 56,
                );
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                pokemon.specie.capitalizedName,
                style: TextStyle(fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }
}
