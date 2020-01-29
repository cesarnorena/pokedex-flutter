// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pokedex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokedex _$PokedexFromJson(Map<String, dynamic> json) {
  return Pokedex(
    (json['pokemon_entries'] as List)
        ?.map((e) =>
            e == null ? null : PokedexEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokedexToJson(Pokedex instance) => <String, dynamic>{
      'pokemon_entries': instance.entries,
    };
