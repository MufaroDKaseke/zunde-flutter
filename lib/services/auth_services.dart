// auth_services.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import 'http_client.dart';

class AuthService {
  static Future<http.Response> registerUser(
    String name,
    String address,
    String language,
    String id_number,
    String phone_number,
  ) async {
    final response = await HttpClientWithCookies.client.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: HttpClientWithCookies.headers,
      body: jsonEncode({
        'phone_number': phone_number,
        'name': name,
        'language': language,
        'id_number': id_number,
        'address': address,
      }),
    );
    HttpClientWithCookies.updateSessionCookie(response);
    return response;
  }

  static Future<http.Response> verifyOTP(
    String otp,
    String phone_number,
  ) async {
    final response = await HttpClientWithCookies.client.post(
      Uri.parse('$baseUrl/auth/verify-otp'),
      headers: HttpClientWithCookies.headers,
      body: jsonEncode({'phone_number': phone_number, 'otp': otp}),
    );
    HttpClientWithCookies.updateSessionCookie(response);
    return response;
  }

  static Future<http.Response> sendOtp(String phone_number) async {
    final response = await HttpClientWithCookies.client.post(
      Uri.parse('$baseUrl/auth/send-otp'),
      headers: HttpClientWithCookies.headers,
      body: jsonEncode({'phone_number': phone_number}),
    );
    HttpClientWithCookies.updateSessionCookie(response);
    return response;
  }
}
