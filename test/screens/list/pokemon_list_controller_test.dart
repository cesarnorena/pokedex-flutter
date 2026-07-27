import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/entities/pokedex.dart';
import 'package:pokedex_flutter/data/pokedex_repository.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_controller.dart';

class _FakeRepository implements PokedexRepository {
  final completer = Completer<Pokedex>();

  @override
  Future<Pokedex> fetch(int id) => completer.future;
}

void main() {
  group('PokemonListController', () {
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
