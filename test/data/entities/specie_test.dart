import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/entities/specie.dart';

void main() {
  group('Specie', () {
    test('fromJson parses the name', () {
      final specie = Specie.fromJson({'name': 'pikachu'});

      expect(specie.name, 'pikachu');
    });

    test('capitalizedName uppercases only the first letter', () {
      expect(Specie(name: 'pikachu').capitalizedName, 'Pikachu');
    });

    test('capitalizedName handles a single-character name', () {
      expect(Specie(name: 'x').capitalizedName, 'X');
    });

    test('capitalizedName leaves an already-capitalized name unchanged', () {
      expect(Specie(name: 'Mew').capitalizedName, 'Mew');
    });
  });
}
