import 'package:flutter/material.dart';

// lib/features/auth/data/welcome_button_data.dart
class ButtonData {
  final String title;
  final String icon; // Changed from Icon to icon (lowercase, asset path)
  final VoidCallback onPressed; // Uncommented for button action

  ButtonData({
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  static List<ButtonData> getButtonList() {
    return [
      ButtonData(
        icon: 'assets/icons/wa.png', // Added 'assets/icons/' prefix
        title: 'Lanjutkan dengan WhatsApp',
        onPressed: () {
          print('Button 1 pressed'); // Placeholder action
        },
      ),
      ButtonData(
        icon: 'assets/icons/g.png',
        title: 'Lanjutkan dengan Google',
        onPressed: () {
          print('Button 2 pressed'); // Placeholder action
        },
      ),
    ];
  }
}
