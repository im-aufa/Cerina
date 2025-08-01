// lib/features/auth/widget/welcome_widget.dart
import 'package:cerina/features/auth/data/welcome_button_data.dart';
import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final ButtonData data;

  const WelcomeButton({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: GestureDetector(
        onTap: data.onPressed, // Trigger the button's action
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (data.icon.isNotEmpty) ...[
                Image.asset(
                  data.icon,
                  width: 24,
                  height: 24,
                  errorBuilder: (context, error, stackTrace) {
                    print('Icon loading error: $error');
                    return const Icon(Icons.error, size: 24);
                  },
                ),
                const SizedBox(width: 8),
              ],
              Text(
                data.title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
