import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';

void main() {
  group('PokedexEntry', () {
    test('fromJson parses entry number and nested species', () {
      final entry = PokedexEntry.fromJson({
        'entry_number': 25,
        'pokemon_species': {'name': 'pikachu'},
      });

      expect(entry.id, 25);
      expect(entry.specie.name, 'pikachu');
    });

    final formattedIdCases = {
      1: '001',
      12: '012',
      150: '150',
    };

    for (final MapEntry(key: id, value: expected) in formattedIdCases.entries) {
      test('formattedId pads id $id to "$expected"', () {
        final entry = _entryWithId(id);

        expect(entry.formattedId, expected);
      });
    }

    test('imageUrl builds the pokemon.com asset URL from formattedId', () {
      final entry = _entryWithId(4);

      expect(
        entry.imageUrl,
        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png',
      );
    });
  });
}

PokedexEntry _entryWithId(int id) {
  return PokedexEntry.fromJson({
    'entry_number': id,
    'pokemon_species': {'name': 'placeholder'},
  });
}
