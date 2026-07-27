import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';
import 'package:pokedex_flutter/data/pokedex_repository.dart';

class PokemonListState {
  final List<PokedexEntry>? entries;
  final bool isLoading;
  final Object? error;

  const PokemonListState({
    this.entries,
    this.isLoading = false,
    this.error,
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

    try {
      final response = await _repository.fetch(1);
      value = PokemonListState(entries: response.entries);
    } catch (error) {
      value = PokemonListState(error: error);
    }
  }
}
