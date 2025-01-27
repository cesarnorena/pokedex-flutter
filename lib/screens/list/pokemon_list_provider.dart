import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/data/pokedex_repository.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_controller.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_screen.dart';
import 'package:provider/provider.dart';

class PokemonListProvider extends StatelessWidget {
  const PokemonListProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();
    final repository = DefaultPokedexRepository(http: httpClient);

    return Provider(
      create: (_) => PokemonListController(
        repository: repository,
      )..fetch(),
      child: const PokemonListScreen(),
    );
  }
}
