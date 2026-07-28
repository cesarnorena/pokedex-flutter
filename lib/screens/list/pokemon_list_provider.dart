import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/data/network/api_client.dart';
import 'package:pokedex_flutter/data/pokedex_repository.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_controller.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_screen.dart';
import 'package:provider/provider.dart';

class PokemonListProvider extends StatefulWidget {
  const PokemonListProvider({super.key});

  @override
  State<PokemonListProvider> createState() => _PokemonListProviderState();
}

class _PokemonListProviderState extends State<PokemonListProvider> {
  late final HttpApiClient _apiClient;
  late final PokemonListController _controller;

  @override
  void initState() {
    super.initState();

    _apiClient = HttpApiClient(
      http: http.Client(),
      baseUrl: pokeApiBaseUrl,
    );
    final repository = DefaultPokedexRepository(client: _apiClient);

    _controller = PokemonListController(repository: repository)..fetch();
  }

  @override
  void dispose() {
    _controller.dispose();
    _apiClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _controller,
      child: const PokemonListScreen(),
    );
  }
}
