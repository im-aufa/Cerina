// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cerina/features/auth/data/auth_service.dart';

class ApiService {
  final AuthService authService;
  static const String _apiUrl = 'https://api.aufaim.com/chat';

  ApiService(this.authService);

  Future<String> getChatResponse(String query) async {
    print("Getting access token...");
    // 1. Get the token from AuthService
    final token = await authService.getAccessToken();
    print("Access token: $token");
    if (token == null) {
      throw Exception('Authentication Error: Could not get access token.');
    }

    // 2. Make the authenticated API call
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // <-- Use the JWT here
        },
        body: json.encode({'query': query, 'n_results': 5}),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body)['response'];
      } else {
        throw Exception('API Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print("Error in getChatResponse: $e");
      throw Exception('Network Error: $e');
    }
  }
}
