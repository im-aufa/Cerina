// lib/core/utils/responsive.dart
import 'package:flutter/material.dart';

class Responsive {
  late double _screenWidth;
  late double _screenHeight;
  late double _appBarHeight;
  late double _statusBarHeight;

  // Singleton pattern (optional)
  static final Responsive _instance = Responsive._internal();
  factory Responsive() => _instance;
  Responsive._internal();

  void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _appBarHeight = AppBar().preferredSize.height + _statusBarHeight;
  }

  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;
  double get appBarHeight => _appBarHeight;
  double get statusBarHeight => _statusBarHeight;

  double width(double percentage) => _screenWidth * (percentage / 100);
  double height(double percentage) => _screenHeight * (percentage / 100);
  double fontSize(double size) => _screenWidth * (size / 375);

  double get pinkHeight => _screenHeight * 0.12;
  double get remainingPinkHeight => pinkHeight - _appBarHeight;
}
