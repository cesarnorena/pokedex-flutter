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
  late final http.Client _httpClient;
  late final PokemonListController _controller;

  @override
  void initState() {
    super.initState();

    _httpClient = http.Client();
    final apiClient = HttpApiClient(
      http: _httpClient,
      baseUrl: pokeApiBaseUrl,
    );
    final repository = DefaultPokedexRepository(client: apiClient);

    _controller = PokemonListController(repository: repository)..fetch();
  }

  @override
  void dispose() {
    _controller.dispose();
    _httpClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _controller,
      child: const PokemonListScreen(),
    );
  }
}
