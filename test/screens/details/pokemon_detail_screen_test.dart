import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';
import 'package:pokedex_flutter/data/entities/specie.dart';
import 'package:pokedex_flutter/screens/details/pokemon_detail_screen.dart';

void main() {
  group('PokemonDetailScreen', () {
    testWidgets('shows the formatted id and capitalized name', (
      tester,
    ) async {
      final pokemon = PokedexEntry(id: 1, specie: Specie(name: 'bulbasaur'));

      await tester.pumpWidget(
        MaterialApp(home: PokemonDetailScreen(pokemon)),
      );

      expect(find.text('001'), findsOneWidget);
      expect(find.text('Bulbasaur'), findsNWidgets(2));
    });

    testWidgets('pops the route when the close button is tapped', (
      tester,
    ) async {
      final pokemon = PokedexEntry(id: 1, specie: Specie(name: 'bulbasaur'));

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => PokemonDetailScreen(pokemon)),
              ),
              child: const Text('open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.byType(PokemonDetailScreen), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.byType(PokemonDetailScreen), findsNothing);
    });
  });
}
