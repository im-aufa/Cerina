import 'package:cerina/features/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../data/onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  final bool isFinalPage;

  const OnboardingPage({
    super.key,
    required this.data,
    this.isFinalPage = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isFinalPage) {
      return _buildFinalPageContent(context);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.title,
            style: const TextStyle(
              color: Colors.white, // White text for pages 1-3
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data.description,
            style: const TextStyle(
              color:
                  Colors.white70, // Slightly transparent white for description
              fontSize: 18,
            ),
          ),
          if (data.image.isNotEmpty) ...[
            const SizedBox(height: 16),
            Image.asset(
              data.image,
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) {
                print('Image loading error: $error');
                return const Icon(Icons.error, size: 150, color: Colors.red);
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFinalPageContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Selamat Datang di",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          if (data.image.isNotEmpty) ...[
            Image.asset(
              data.image,
              width: 290,
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                print('Image loading error: $error');
                return const Icon(Icons.error, size: 150, color: Colors.red);
              },
            ),
          ],
          const SizedBox(height: 8),
          const Text(
            "Let’s dive into the adventure.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink[600],
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Mulai",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
