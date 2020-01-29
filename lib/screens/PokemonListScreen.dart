import 'package:flutter/material.dart';

import './PokemonDetailScreen.dart';
import '../resources/AppLocalizations.dart';
import '../data/PokedexRepository.dart';
import '../data/Entities/PokedexEntry.dart';

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
      appBar: _buildAppBar(context),
      body: _buildListView(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context).appTitle),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
        itemCount: _pokemonList.length,
        itemBuilder: (ctx, idx) {
          return InkWell(
            onTap: () {
              _onItemClick(idx);
            },
            child: _PokemonListItemWidget(_pokemonList[idx]),
          );
        });
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

  _onItemClick(int index) {
    Navigator.pushNamed(
      context,
      PokemonDetailScreen.route,
      arguments: _pokemonList[index],
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
            child: Row(children: <Widget>[
              Image.network(
                pokemon.imageUrl(),
                width: 56,
                height: 56,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    pokemon.specie.capitalizedName(),
                    style: TextStyle(fontSize: 22),
                  ))
            ])));
  }
}
