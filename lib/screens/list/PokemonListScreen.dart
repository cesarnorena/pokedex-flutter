import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/data/Entities/PokedexEntry.dart';
import 'package:pokedex_flutter/data/PokedexRepository.dart';
import 'package:pokedex_flutter/screens/details/PokemonDetailScreen.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_widget.dart';

class PokemonListScreen extends StatelessWidget {
  static const route = '/list';

  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = PokedexRepository(http: http.Client());

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
      ),
      body: FutureBuilder<List<PokedexEntry>>(
        future: repository.fetch(1).then((e) => e.entries),
        builder: (context, snapshot) {
          final entries = snapshot.data ?? [];

          return PokemonListWidget(
            entries,
            (index) => _onItemClick(context, entries[index]),
          );
        },
      ),
    );
  }

  void _onItemClick(BuildContext context, PokedexEntry entry) {
    Navigator.pushNamed(
      context,
      PokemonDetailScreen.route,
      arguments: entry,
    );
  }
}
