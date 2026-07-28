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
  bool _disposed = false;

  PokemonListController({
    required PokedexRepository repository,
  })  : _repository = repository,
        super(const PokemonListState());

  Future<void> fetch() async {
    value = const PokemonListState(isLoading: true);

    try {
      final response = await _repository.fetch(1);
      if (_disposed) return;
      value = PokemonListState(entries: response.entries);
    } catch (error) {
      if (_disposed) return;
      value = PokemonListState(error: error);
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
