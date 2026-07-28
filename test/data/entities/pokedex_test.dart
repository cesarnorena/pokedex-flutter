import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/entities/pokedex.dart';

void main() {
  group('Pokedex', () {
    test('fromJson maps each pokemon_entries item to a PokedexEntry', () {
      final pokedex = Pokedex.fromJson({
        'pokemon_entries': [
          {
            'entry_number': 1,
            'pokemon_species': {'name': 'bulbasaur'},
          },
          {
            'entry_number': 2,
            'pokemon_species': {'name': 'ivysaur'},
          },
        ],
      });

      expect(pokedex.entries, hasLength(2));
      expect(pokedex.entries[0].id, 1);
      expect(pokedex.entries[0].specie.name, 'bulbasaur');
      expect(pokedex.entries[1].id, 2);
      expect(pokedex.entries[1].specie.name, 'ivysaur');
    });

    test('fromJson handles an empty pokemon_entries list', () {
      final pokedex = Pokedex.fromJson({'pokemon_entries': []});

      expect(pokedex.entries, isEmpty);
    });
  });
}
