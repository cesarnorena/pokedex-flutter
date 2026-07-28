import 'package:pokedex_flutter/data/entities/pokedex.dart';
import 'package:pokedex_flutter/data/network/api_client.dart';

const pokeApiBaseUrl = "https://pokeapi.co/api/v2";

abstract interface class PokedexRepository {
  Future<Pokedex> fetch(int id);
}

class DefaultPokedexRepository implements PokedexRepository {
  final ApiClient _client;

  DefaultPokedexRepository({required ApiClient client}) : _client = client;

  @override
  Future<Pokedex> fetch(int id) async {
    final json = await _client.get("/pokedex/$id");
    if (json is! Map<String, dynamic>) {
      throw const ApiDecodeException();
    }
    return Pokedex.fromJson(json);
  }
}
