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
    PokedexEntry pokemon = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: _buildAppBar(
        context,
        pokemon.specie.capitalizedName(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, left: 40, right: 40),
            child: Image.network(pokemon.imageUrl()),
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
                pokemon.specie.capitalizedName(),
                style: TextStyle(fontSize: 28),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(title),
    );
  }
}
