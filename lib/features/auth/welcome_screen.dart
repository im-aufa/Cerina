import 'package:cerina/features/auth/data/auth_service.dart';
import 'package:cerina/features/auth/widget/welcome_widget.dart';
import 'package:cerina/features/auth/data/welcome_button_data.dart';
import 'package:cerina/core/utils/navbar.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final AuthService _authService = AuthService();

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Navbar(),
      ),
    );
  }

  Future<void> _loginAndNavigate() async {
    final credentials = await _authService.login();
    if (credentials != null && mounted) {
      _navigateToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<ButtonData> buttons =
        ButtonData.getButtonList(_loginAndNavigate);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/CerinaLogo.png',
              width: 311,
              height: 263,
              errorBuilder: (context, error, stackTrace) {
                print('Logo loading error: $error');
                return const Icon(Icons.error, size: 263);
              },
            ),
            const SizedBox(height: 8), // Space between logo and buttons
            ...buttons.map((buttonData) => WelcomeButton(data: buttonData)),
            // Space between buttons and text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah Punya Akun?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: _navigateToHome,
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      color: Colors.pink,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
