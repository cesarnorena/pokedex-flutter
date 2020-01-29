import 'package:json_annotation/json_annotation.dart';
import 'Specie.dart';

part 'PokedexEntry.g.dart';

@JsonSerializable()
class PokedexEntry {
  @JsonKey(name: 'entry_number')
  int id;

  @JsonKey(name: 'pokemon_species')
  Specie specie;

  String imageUrl() =>
      "http://assets.pokemon.com/assets/cms2/img/pokedex/full/${formattedId()}.png";

  String formattedId() {
    if (id < 10) return "00$id";

    if (id < 100) return "0$id";

    return id.toString();
  }

  PokedexEntry(this.id, this.specie);

  factory PokedexEntry.fromJson(Map<String, dynamic> json) =>
      _$PokedexEntryFromJson(json);
}
