import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';
import 'package:pokedex_flutter/screens/details/pokemon_detail_screen.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_controller.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_widget.dart';
import 'package:provider/provider.dart';

class PokemonListScreen extends StatelessWidget {
  static const route = 'pokemons/list';

  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.app_title),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: context.read<PokemonListController>(),
          builder: (context, value, _) {
            final entries = value.entries ?? [];

            return PokemonListWidget(
              entries: entries,
              onItemClick: (index) => _onItemClick(context, entries[index]),
            );
          },
        ),
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
