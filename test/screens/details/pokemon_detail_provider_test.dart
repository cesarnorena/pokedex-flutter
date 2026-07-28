import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/entities/pokedex_entry.dart';
import 'package:pokedex_flutter/data/entities/specie.dart';
import 'package:pokedex_flutter/screens/details/pokemon_detail_provider.dart';
import 'package:pokedex_flutter/screens/details/pokemon_detail_screen.dart';

void main() {
  testWidgets(
    'reads the PokedexEntry from the route arguments and renders it',
    (tester) async {
      final pokemon = PokedexEntry(id: 1, specie: Specie(name: 'bulbasaur'));

      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: (settings) => MaterialPageRoute(
            settings: RouteSettings(arguments: pokemon),
            builder: (_) => const PokemonDetailProvider(),
          ),
        ),
      );

      final screen = tester.widget<PokemonDetailScreen>(
        find.byType(PokemonDetailScreen),
      );
      expect(screen.pokemon, pokemon);
    },
  );
}
