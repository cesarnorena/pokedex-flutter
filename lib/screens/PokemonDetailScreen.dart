import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/Entities/PokedexEntry.dart';

class PokemonDetailScreen extends StatefulWidget {
  static final route = '/detail';

  @override
  State createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetailScreen> {
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
          GestureDetector(
            onTap: () async {
              final url = 'https://www.nu.com.mx';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                pokemon.specie.capitalizedName,
                style: TextStyle(fontSize: 28),
              ),
            ),
          )
        ],
      ),
    );
  }
}
