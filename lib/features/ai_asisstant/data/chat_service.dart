import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  static const String baseUrl = "https://api.aufaim.com"; // VPS URL
  // For local testing: "http://192.168.1.5:8000" or "http://localhost:8000"
  static const String apiKey =
      String.fromEnvironment('API_KEY'); // Load from --dart-define

  final List<Map<String, String>> chatMessages = [
    {
      "role": "system",
      "content":
          "I am Cerince, your friendly assistant! I can chat with you about anything or provide specific information about menstruation and cervix when relevant."
    },
  ];

  void addUserMessage(String message) {
    chatMessages.add({"role": "user", "content": message});
  }

  void addSystemMessage(String message) {
    chatMessages.add({"role": "system", "content": message});
  }

  Future<String> sendMessage(String message) async {
    if (apiKey.isEmpty) {
      throw Exception('API key is not configured');
    }

    final data = {"query": message, "n_results": 5};

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/chat"),
        headers: {
          "Content-Type": "application/json",
          "X-API-Key": apiKey,
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData["response"];
      } else {
        throw Exception(
            'Failed to get response: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
