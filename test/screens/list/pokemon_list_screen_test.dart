import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/entities/pokedex.dart';
import 'package:pokedex_flutter/data/pokedex_repository.dart';
import 'package:pokedex_flutter/l10n/app_localizations.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_controller.dart';
import 'package:pokedex_flutter/screens/list/pokemon_list_screen.dart';
import 'package:provider/provider.dart';

class _NeverResolvingRepository implements PokedexRepository {
  @override
  Future<Pokedex> fetch(int id) => Completer<Pokedex>().future;
}

void main() {
  testWidgets('shows a loading indicator while the list is loading',
      (tester) async {
    final controller = PokemonListController(
      repository: _NeverResolvingRepository(),
    )..fetch();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ChangeNotifierProvider.value(
          value: controller,
          child: const PokemonListScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
