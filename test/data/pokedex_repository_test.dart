import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/data/network/api_client.dart';
import 'package:pokedex_flutter/data/pokedex_repository.dart';

class _FakeApiClient implements ApiClient {
  final dynamic response;
  final Object? error;
  String? requestedPath;

  _FakeApiClient({this.response, this.error});

  @override
  Future<dynamic> get(String path) async {
    requestedPath = path;
    if (error != null) throw error!;
    return response;
  }
}

void main() {
  group('DefaultPokedexRepository', () {
    test('fetch() requests /pokedex/<id> and maps the JSON to a Pokedex',
        () async {
      final client = _FakeApiClient(response: {
        'pokemon_entries': [
          {
            'entry_number': 1,
            'pokemon_species': {'name': 'bulbasaur'},
          },
        ],
      });
      final repository = DefaultPokedexRepository(client: client);

      final pokedex = await repository.fetch(2);

      expect(client.requestedPath, '/pokedex/2');
      expect(pokedex.entries, hasLength(1));
      expect(pokedex.entries.single.specie.name, 'bulbasaur');
    });

    test('fetch() throws ApiDecodeException when the response is not a JSON object',
        () async {
      final client = _FakeApiClient(response: ['not', 'an', 'object']);
      final repository = DefaultPokedexRepository(client: client);

      expect(
        () => repository.fetch(1),
        throwsA(isA<ApiDecodeException>()),
      );
    });

    test('fetch() propagates exceptions thrown by the client', () async {
      final client = _FakeApiClient(error: ApiStatusException(404));
      final repository = DefaultPokedexRepository(client: client);

      expect(
        () => repository.fetch(1),
        throwsA(isA<ApiStatusException>()),
      );
    });
  });
}
