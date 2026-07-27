import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:pokedex_flutter/data/network/api_client.dart';

void main() {
  group('HttpApiClient', () {
    test('get() requests baseUrl + path and returns the decoded JSON body',
        () async {
      late Uri requestedUri;
      final client = HttpApiClient(
        http: MockClient((request) async {
          requestedUri = request.url;
          return http.Response('{"name":"pikachu"}', 200);
        }),
        baseUrl: 'https://example.com/api',
      );

      final result = await client.get('/pokemon/25');

      expect(requestedUri, Uri.parse('https://example.com/api/pokemon/25'));
      expect(result, {'name': 'pikachu'});
    });

    test('get() throws ApiStatusException for a non-2xx response', () async {
      final client = HttpApiClient(
        http: MockClient((request) async => http.Response('Not Found', 404)),
        baseUrl: 'https://example.com/api',
      );

      expect(
        () => client.get('/missing'),
        throwsA(
          isA<ApiStatusException>()
              .having((e) => e.statusCode, 'statusCode', 404),
        ),
      );
    });

    test('get() throws ApiDecodeException when the body is not valid JSON',
        () async {
      final client = HttpApiClient(
        http: MockClient((request) async => http.Response('not json', 200)),
        baseUrl: 'https://example.com/api',
      );

      expect(client.get('/broken'), throwsA(isA<ApiDecodeException>()));
    });

    test('get() throws ApiTimeoutException when the request is too slow',
        () async {
      final client = HttpApiClient(
        http: MockClient((request) async {
          await Future<void>.delayed(const Duration(milliseconds: 50));
          return http.Response('{}', 200);
        }),
        baseUrl: 'https://example.com/api',
        timeout: const Duration(milliseconds: 5),
      );

      expect(client.get('/slow'), throwsA(isA<ApiTimeoutException>()));
    });
  });
}
