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
  bool _isLoading = false;

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Navbar(),
      ),
    );
  }

  Future<void> _loginAndNavigate() async {
    setState(() {
      _isLoading = true;
    });

    final credentials = await _authService.login();

    // After an async call, always check if the widget is still in the tree.
    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    if (credentials != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Successful! Redirecting...'),
          backgroundColor: Colors.green,
        ),
      );
      await Future.delayed(const Duration(milliseconds: 1500)); // Give user time to see the message
      if (mounted) {
        _navigateToHome();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<ButtonData> buttons =
        ButtonData.getButtonList(_loginAndNavigate);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
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
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
