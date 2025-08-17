// lib/widgets/chat_input_widget.dart
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Masukan pertanyaan",
        labelStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink, width: 2),
        ),
        suffixIcon: IconButton(
          onPressed: onSend,
          icon: const Icon(
            Icons.send,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
