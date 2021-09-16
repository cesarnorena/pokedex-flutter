import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokedex_flutter/data/Entities/Pokedex.dart';

class PokedexRepository {
  static const BASE_URL = "https://pokeapi.co/api/v2";
  final Client http;

  const PokedexRepository({
    required this.http,
  });

  Future<Pokedex> fetch(int id) async {
    final url = Uri.parse("$BASE_URL/pokedex/$id");
    final response = await http.get(url);
    return Pokedex.fromJson(jsonDecode(response.body));
  }
}
