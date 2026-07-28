import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/entities/pokedex.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';
import 'package:pokedex_flutter/data/entities/specie.dart';
import 'package:pokedex_flutter/data/pokedex_repository.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_controller.dart';

class _FakeRepository implements PokedexRepository {
  final completer = Completer<Pokedex>();

  @override
  Future<Pokedex> fetch(int id) => completer.future;
}

void main() {
  group('PokemonListController', () {
    test('starts with an empty, non-loading state', () {
      final controller = PokemonListController(repository: _FakeRepository());
      addTearDown(controller.dispose);

      expect(controller.value.entries, isNull);
      expect(controller.value.isLoading, isFalse);
      expect(controller.value.error, isNull);
    });

    test('fetch() sets isLoading to true immediately', () {
      final repository = _FakeRepository();
      final controller = PokemonListController(repository: repository);
      addTearDown(controller.dispose);

      controller.fetch();

      expect(controller.value.isLoading, isTrue);
      expect(controller.value.error, isNull);
    });

    test('fetch() stores the entries when the repository resolves',
        () async {
      final repository = _FakeRepository();
      final controller = PokemonListController(repository: repository);
      addTearDown(controller.dispose);
      final entries = [
        PokedexEntry(id: 1, specie: Specie(name: 'bulbasaur')),
      ];

      final fetchFuture = controller.fetch();
      repository.completer.complete(Pokedex(entries: entries));
      await fetchFuture;

      expect(controller.value.isLoading, isFalse);
      expect(controller.value.entries, entries);
      expect(controller.value.error, isNull);
    });

    test('fetch() stores the error when the repository throws', () async {
      final repository = _FakeRepository();
      final controller = PokemonListController(repository: repository);
      addTearDown(controller.dispose);
      final error = Exception('network error');

      final fetchFuture = controller.fetch();
      repository.completer.completeError(error);
      await fetchFuture;

      expect(controller.value.isLoading, isFalse);
      expect(controller.value.entries, isNull);
      expect(controller.value.error, error);
    });

    test('does not throw when fetch() resolves after dispose()', () async {
      final repository = _FakeRepository();
      final controller = PokemonListController(repository: repository);

      final fetchFuture = controller.fetch();
      controller.dispose();
      repository.completer.complete(Pokedex(entries: []));

      await expectLater(fetchFuture, completes);
    });
  });
}
