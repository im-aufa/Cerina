// lib/features/homepage/widgets/education_card.dart
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const EducationCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: screenSize.width * 0.43,
      height: screenSize.height * 0.15,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink[400]!),
        borderRadius: BorderRadius.circular(screenSize.width * 0.04),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenSize.width * 0.04),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: double.infinity, // Take full width of parent
              height: (screenSize.height * 0.15) * 0.6, // 60% of card height
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            subtitle,
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: textTheme.titleSmall?.fontSize,
                      color: Colors.pink[400],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
