// chat_view_model.dart
import 'package:flutter/foundation.dart';
import 'api_service.dart';

class ChatViewModel extends ChangeNotifier {
  final ApiService _apiService;

  final List<Map<String, String>> chatMessages = [
    {
      "role": "system",
      "content": "I am Cerince, your friendly assistant! How can I help you today?",
    },
  ];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ChatViewModel(this._apiService);

  // This is the main method your UI will call
  Future<void> sendMessage(String message) async {
    if (_isLoading) return; // Prevent sending multiple messages at once

    _setLoading(true);
    _addUserMessage(message);

    try {
      // Use the ApiService to get the response
      final response = await _apiService.getChatResponse(message);
      _addSystemMessage(response);
    } catch (e) {
      // Add error message to the chat for the user to see
      _addSystemMessage("Sorry, an error occurred: \${e.toString()}");
    } finally {
      _setLoading(false);
    }
  }

  void _addUserMessage(String message) {
    chatMessages.add({"role": "user", "content": message});
    notifyListeners();
  }

  void _addSystemMessage(String message) {
    chatMessages.add({"role": "system", "content": message});
    notifyListeners();
  }

  void _setLoading(bool loadingState) {
    _isLoading = loadingState;
    notifyListeners();
  }
}
