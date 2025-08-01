import 'package:flutter/material.dart';

class ChatMessageList extends StatelessWidget {
  final List<Map<String, String>> messages;

  const ChatMessageList({
    super.key,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if (index == 0) return const SizedBox.shrink();
        final message = messages[index];
        return ChatMessageBubble(message: message);
      },
    );
  }
}

class ChatMessageBubble extends StatelessWidget {
  final Map<String, String> message;

  const ChatMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final isSystem = message["role"] == 'system';

    return Align(
      alignment: isSystem ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSystem
              ? Color.fromRGBO(235, 236, 239, 1)
              : Color.fromRGBO(253, 231, 241, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message["content"] ?? '',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
