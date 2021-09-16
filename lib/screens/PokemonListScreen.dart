import 'package:flutter/material.dart';

import './PokemonDetailScreen.dart';
import '../data/Entities/PokedexEntry.dart';
import '../data/PokedexRepository.dart';
import '../localization/AppLocalizations.dart';
import '../screens/pokemon_list_widget.dart';

class PokemonListScreen extends StatefulWidget {
  static const route = '/list';

  @override
  State createState() => _PokemonListState(PokedexRepository());
}

class _PokemonListState extends State<PokemonListScreen> {
  _PokemonListState(this._repository);

  final PokedexRepository _repository;

  final List<PokedexEntry> _pokemonList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle!),
      ),
      body: PokemonListWidget(_pokemonList, _onItemClick),
    );
  }

  _fetchData() async {
    try {
      final response = await _repository.getPokedex(1);
      final list = response.entries;

      setState(() {
        _pokemonList.addAll(list);
      });
    } catch (err) {
      print('Caught error: $err');
    }
  }

  void _onItemClick(int index) {
    Navigator.pushNamed(
      context,
      PokemonDetailScreen.route,
      arguments: _pokemonList[index],
    );
  }
}
