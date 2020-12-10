import 'package:json_annotation/json_annotation.dart';

import 'PokedexEntry.dart';

part 'Pokedex.g.dart';

@JsonSerializable()
class Pokedex {
  Pokedex(this.entries);

  @JsonKey(name: 'pokemon_entries')
  List<PokedexEntry> entries;

  factory Pokedex.fromJson(Map<String, dynamic> json) =>
      _$PokedexFromJson(json);
}
