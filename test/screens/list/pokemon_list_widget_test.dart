import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';
import 'package:pokedex_flutter/data/entities/specie.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_widget.dart';

void main() {
  group('PokemonListWidget', () {
    final entries = [
      PokedexEntry(id: 1, specie: Specie(name: 'bulbasaur')),
      PokedexEntry(id: 2, specie: Specie(name: 'ivysaur')),
    ];

    testWidgets('renders one item per entry', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PokemonListWidget(entries: entries, onItemClick: (_) {}),
          ),
        ),
      );

      expect(find.text('Bulbasaur'), findsOneWidget);
      expect(find.text('Ivysaur'), findsOneWidget);
      expect(find.text('001'), findsOneWidget);
      expect(find.text('002'), findsOneWidget);
    });

    testWidgets('invokes onItemClick with the tapped index', (tester) async {
      int? tappedIndex;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PokemonListWidget(
              entries: entries,
              onItemClick: (index) => tappedIndex = index,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Ivysaur'));

      expect(tappedIndex, 1);
    });
  });
}
