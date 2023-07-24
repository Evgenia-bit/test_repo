import 'dart:convert';
import 'dart:io';

enum ApiClientExceptionType { network, auth, other }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://jsonplaceholder.typicode.com';

  Future<String> auth({
    required String login,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    const sessionId = '111111';
    return sessionId;
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<dynamic> getFriendsList() async {
    try {
      final url = _makeUri('/users');
      final request = await _client.getUrl(url);
      final response = await request.close();
      final json = (await response.jsonDecode()) as List<dynamic>;
      return json;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder).toList().then((value) {
      final result = value.join();
      return result;
    }).then<dynamic>((v) => json.decode(v));
  }
}
