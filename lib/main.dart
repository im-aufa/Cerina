import 'package:cerina/features/auth/data/auth_service.dart';
import 'package:cerina/core/utils/navbar.dart';
import 'package:cerina/features/onboarding/onboarding_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await dotenv.load();
  await initializeDateFormatting('id_ID', null);

  final authService = AuthService();
  bool isAuthenticated = false;

  if (kIsWeb) {
    await authService.handleWebLogin();
    isAuthenticated = authService.isAuthenticated();
  }

  runApp(MainApp(
    isAuthenticated: isAuthenticated,
  ));
}

class MainApp extends StatelessWidget {
  final bool isAuthenticated;
  const MainApp({super.key, required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cerina',
      home: isAuthenticated ? const Navbar() : const OnboardingScreen(),
    );
  }
}
