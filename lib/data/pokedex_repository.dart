import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokedex_flutter/data/entities/pokedex.dart';

abstract interface class PokedexRepository {
  Future<Pokedex> fetch(int id);
}

class DefaultPokedexRepository implements PokedexRepository {
  static const _baseUrl = "https://pokeapi.co/api/v2";
  final Client _http;

  DefaultPokedexRepository({required Client http}) : _http = http;

  @override
  Future<Pokedex> fetch(int id) async {
    final url = Uri.parse("$_baseUrl/pokedex/$id");
    final response = await _http.get(url);
    return Pokedex.fromJson(jsonDecode(response.body));
  }
}
