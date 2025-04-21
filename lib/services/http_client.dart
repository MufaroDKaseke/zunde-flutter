// lib/services/http_client.dart
import 'package:http/http.dart' as http;

class HttpClientWithCookies {
  static final http.Client _client = http.Client();
  static String? _sessionCookie;

  static http.Client get client => _client;

  static Map<String, String> get headers {
    final headers = {'Content-Type': 'application/json'};
    if (_sessionCookie != null) {
      headers['cookie'] = _sessionCookie!;
    }
    return headers;
  }

  static void updateSessionCookie(http.Response response) {
    final setCookie = response.headers['set-cookie'];
    if (setCookie != null) {
      _sessionCookie = setCookie.split(';').first;
    }
  }
}
