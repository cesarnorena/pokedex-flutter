import 'dart:convert';

import 'package:http/http.dart' as http;

import './Entities/Pokedex.dart';

class PokedexRepository {
  static const URL = "https://pokeapi.co/api/v2";

  Future<Pokedex> getPokedex(int id) async {
    final client = http.Client();
    final url = Uri.parse("$URL/pokedex/$id");
    final response = await client.get(url);
    client.close();
    return _parsePokedex(response.body);
  }

  Pokedex _parsePokedex(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return Pokedex.fromJson(json);
  }
}
