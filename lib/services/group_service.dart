// group_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import 'http_client.dart';

class GroupService {
  static Future<http.Response> createGroup(String name, String cycleType, String contributionAmount, String description) async {
    final response = await HttpClientWithCookies.client.post(
      Uri.parse('$baseUrl/group'),
      headers: HttpClientWithCookies.headers,
      body: jsonEncode({
        'name': name,
        'cycle_type': cycleType,
        'contribution_amount': contributionAmount,
        'description': description,
      }),
    );
    return response;
  }
}
