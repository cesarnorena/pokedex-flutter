// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PokedexEntry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokedexEntry _$PokedexEntryFromJson(Map<String, dynamic> json) {
  return PokedexEntry(
    json['entry_number'] as int,
    json['pokemon_species'] == null
        ? null
        : Specie.fromJson(json['pokemon_species'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokedexEntryToJson(PokedexEntry instance) =>
    <String, dynamic>{
      'entry_number': instance.id,
      'pokemon_species': instance.specie,
    };
