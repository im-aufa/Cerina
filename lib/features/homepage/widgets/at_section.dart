// lib/features/homepage/widgets/at_section.dart
import 'package:flutter/material.dart';
import '../data/homepage_data.dart';
import 'at_card.dart';

class AtSection extends StatelessWidget {
  final HomepageData data;

  const AtSection({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.atSectionText,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.01),
        AtCard(
          imagePath: data.atSectionItems[0]['image']!,
          title: data.atSectionItems[0]['title']!,
          subtitle: data.atSectionItems[0]['subtitle']!,
          isReversed: false,
        ),
        SizedBox(height: screenHeight * 0.01),
        AtCard(
          imagePath: data.atSectionItems[1]['image']!,
          title: data.atSectionItems[1]['title']!,
          subtitle: data.atSectionItems[1]['subtitle']!,
          isReversed: true,
        ),
      ],
    );
  }
}
