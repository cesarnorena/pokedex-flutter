import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/Entities/PokedexEntry.dart';

class PokemonDetailScreen extends StatelessWidget {
  static final route = '/detail';

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
            margin: EdgeInsets.only(top: 24, left: 40, right: 40),
            child: Image.network(
              pokemon.imageUrl,
              errorBuilder: (ctx, _, __) {
                return Container(
                  child: Icon(Icons.image_not_supported),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              pokemon.specie.capitalizedName,
              style: TextStyle(fontSize: 28),
            ),
          )
        ],
      ),
    );
  }
}
