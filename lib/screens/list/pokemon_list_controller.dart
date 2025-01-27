import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';
import 'package:pokedex_flutter/data/pokedex_repository.dart';

class PokemonListState {
  final List<PokedexEntry>? entries;
  final bool isLoading;

  const PokemonListState({
    this.entries,
    this.isLoading = false,
  });
}

class PokemonListController extends ValueNotifier<PokemonListState> {
  final PokedexRepository _repository;

  PokemonListController({
    required PokedexRepository repository,
  })  : _repository = repository,
        super(const PokemonListState());

  Future<void> fetch() async {
    value = const PokemonListState(isLoading: true);

    final response = await _repository.fetch(1);

    value = PokemonListState(entries: response.entries);
  }
}
