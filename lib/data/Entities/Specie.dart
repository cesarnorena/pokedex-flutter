class Specie {
  final String name;

  Specie({required this.name});

  String get capitalizedName => name[0].toUpperCase() + name.substring(1);

  factory Specie.fromJson(Map<String, dynamic> json) {
    return Specie(name: json['name'] as String);
  }
}
