import 'package:json_annotation/json_annotation.dart';

part 'Specie.g.dart';

@JsonSerializable()
class Specie {
  Specie(this.name);

  @JsonKey(name: 'name')
  String name;

  String get capitalizedName => name[0].toUpperCase() + name.substring(1);

  factory Specie.fromJson(Map<String, dynamic> json) => _$SpecieFromJson(json);
}
