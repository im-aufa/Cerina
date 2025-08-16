import 'package:flutter/material.dart';

class ButtonData {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  ButtonData({
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  static List<ButtonData> getButtonList(VoidCallback loginCallback) {
    return [
      ButtonData(
        icon: 'assets/icons/wa.png',
        title: 'Lanjutkan dengan WhatsApp',
        onPressed: loginCallback,
      ),
      ButtonData(
        icon: 'assets/icons/g.png',
        title: 'Lanjutkan dengan Google',
        onPressed: loginCallback,
      ),
    ];
  }
}