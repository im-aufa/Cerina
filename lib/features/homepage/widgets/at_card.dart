// lib/features/homepage/widgets/at_card.dart
import 'package:flutter/material.dart';

class AtCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final bool isReversed;

  const AtCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.isReversed,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    // Fixed dimensions for image
    const double imageWidth = 175; // Fixed 175px
    const double imageHeight = 135; // Fixed 135px

    final textContent = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subtitle,
            style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

    final imageContent = ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left:
            isReversed ? Radius.circular(screenSize.width * 0.04) : Radius.zero,
        right: !isReversed
            ? Radius.circular(screenSize.width * 0.04)
            : Radius.zero,
      ),
      child: Image.asset(
        imagePath,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.cover,
      ),
    );

    return Container(
      height: imageHeight, // Matches image height
      margin: EdgeInsets.only(bottom: screenSize.width * 0.02),
      decoration: BoxDecoration(
        color: Colors.pink[400], // Pink background across entire card
        borderRadius: BorderRadius.circular(screenSize.width * 0.04),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: isReversed
            ? [imageContent, textContent]
            : [textContent, imageContent],
      ),
    );
  }
}
