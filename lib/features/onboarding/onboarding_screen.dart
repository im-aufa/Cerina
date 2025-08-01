import 'package:cerina/features/onboarding/data/onboarding_data.dart';
import 'package:cerina/features/onboarding/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  final List<OnboardingData> _pages = OnboardingData.getPages();
  int _currentPage = 0;
  bool _imagesPreloaded = false; // Flag to preload images only once

  // List of background images for pages 1-3
  final List<String> _backgroundImages = [
    'assets/images/onboarding1.png', // Page 1
    'assets/images/onboarding2.png', // Page 2
    'assets/images/onboarding3.png', // Page 3
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preload images only once after dependencies are available
    if (!_imagesPreloaded) {
      for (var image in _backgroundImages) {
        precacheImage(AssetImage(image), context);
      }
      _imagesPreloaded = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Dynamic background based on page
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _currentPage < _pages.length - 1
                ? Container(
                    key: ValueKey('background$_currentPage'),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_backgroundImages[_currentPage]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    key: const ValueKey('whiteBackground'),
                    color: Colors.white,
                  ),
          ),
          // Page content
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  children: _pages.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final OnboardingData data = entry.value;
                    if (index == _pages.length - 1) {
                      return OnboardingPage(
                        data: data,
                        isFinalPage: true,
                      );
                    }
                    return OnboardingPage(data: data);
                  }).toList(),
                ),
              ),
              // Page indicator (only for first 3 pages, hidden on page 4)
              if (_currentPage < _pages.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: _pages.length - 1, // Show only 3 dots
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.white, // Changed to white
                      dotHeight: 12,
                      dotWidth: 12,
                      spacing: 16,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
