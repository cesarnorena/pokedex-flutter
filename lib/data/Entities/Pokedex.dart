import 'package:pokedex_flutter/data/Entities/PokedexEntry.dart';

class Pokedex {
  final List<PokedexEntry> entries;

  Pokedex({required this.entries});

  factory Pokedex.fromJson(Map<String, dynamic> json) {
    return Pokedex(
      entries: (json['pokemon_entries'] as List<dynamic>)
          .map((e) => PokedexEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
