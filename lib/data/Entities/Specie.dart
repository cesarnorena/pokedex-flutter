import 'package:json_annotation/json_annotation.dart';

part 'Specie.g.dart';

@JsonSerializable()
class Specie {
  @JsonKey(name: 'name')
  String name;

  String capitalizedName() => name[0].toUpperCase() + name.substring(1);

  Specie(this.name);

  factory Specie.fromJson(Map<String, dynamic> json) => _$SpecieFromJson(json);
}
