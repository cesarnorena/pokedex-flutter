import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract interface class ApiClient {
  Future<dynamic> get(String path);
}

sealed class ApiException implements Exception {
  final String message;

  const ApiException(this.message);

  @override
  String toString() => message;
}

final class ApiTimeoutException extends ApiException {
  const ApiTimeoutException() : super('The request timed out.');
}

final class ApiStatusException extends ApiException {
  final int statusCode;

  ApiStatusException(this.statusCode)
      : super('Request failed with status code $statusCode.');
}

final class ApiDecodeException extends ApiException {
  const ApiDecodeException() : super('Failed to decode the response body.');
}

class HttpApiClient implements ApiClient {
  final http.Client _http;
  final String baseUrl;
  final Duration timeout;

  HttpApiClient({
    required http.Client http,
    required this.baseUrl,
    this.timeout = const Duration(seconds: 10),
  }) : _http = http;

  @override
  Future<dynamic> get(String path) async {
    final url = Uri.parse('$baseUrl$path');

    final http.Response response;
    try {
      response = await _http.get(url).timeout(timeout);
    } on TimeoutException {
      throw const ApiTimeoutException();
    }

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiStatusException(response.statusCode);
    }

    try {
      return jsonDecode(response.body);
    } on FormatException {
      throw const ApiDecodeException();
    }
  }

  void close() => _http.close();
}
