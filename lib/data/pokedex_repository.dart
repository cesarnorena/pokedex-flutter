import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokedex_flutter/data/Entities/pokedex.dart';

class PokedexRepository {
  static const baseUrl = "https://pokeapi.co/api/v2";
  final Client http;

  const PokedexRepository({
    required this.http,
  });

  Future<Pokedex> fetch(int id) async {
    final url = Uri.parse("$baseUrl/pokedex/$id");
    final response = await http.get(url);
    return Pokedex.fromJson(jsonDecode(response.body));
  }
}
