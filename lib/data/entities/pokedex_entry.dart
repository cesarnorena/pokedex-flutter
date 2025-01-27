import 'package:pokedex_flutter/data/entities/specie.dart';

class PokedexEntry {
  final int id;
  final Specie specie;

  PokedexEntry({
    required this.id,
    required this.specie,
  });

  String get formattedId {
    if (id < 10) return "00$id";
    if (id < 100) return "0$id";
    return id.toString();
  }

  String get imageUrl =>
      "https://assets.pokemon.com/assets/cms2/img/pokedex/full/$formattedId.png";

  factory PokedexEntry.fromJson(Map<String, dynamic> json) {
    return PokedexEntry(
      id: json['entry_number'] as int,
      specie: Specie.fromJson(
        json['pokemon_species'] as Map<String, dynamic>,
      ),
    );
  }
}
