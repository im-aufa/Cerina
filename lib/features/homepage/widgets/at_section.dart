// lib/features/homepage/widgets/at_section.dart
import 'package:flutter/material.dart';
import 'package:cerina/core/utils/responsive.dart';
import '../data/homepage_data.dart';
import 'at_card.dart'; // Adjust path

class AtSection extends StatelessWidget {
  final HomepageData data;
  final double topPosition;

  const AtSection({
    super.key,
    required this.data,
    required this.topPosition,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive();
    responsive.init(context);

    return Positioned(
      top: topPosition,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsive.width(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row (header)
            Text(
              data.atSectionText,
              style: TextStyle(
                fontSize: responsive.fontSize(16),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.height(1)),
            // Containers (one per row)
            AtCard(
              imagePath: data.atSectionItems[0]['image']!,
              title: data.atSectionItems[0]['title']!,
              subtitle: data.atSectionItems[0]['subtitle']!,
              responsive: responsive,
              isReversed: false, // Pink text on left, Image on right
            ),
            SizedBox(height: responsive.height(1)),
            AtCard(
              imagePath: data.atSectionItems[1]['image']!,
              title: data.atSectionItems[1]['title']!,
              subtitle: data.atSectionItems[1]['subtitle']!,
              responsive: responsive,
              isReversed: true, // Image on left, Pink text on right
            ),
          ],
        ),
      ),
    );
  }
}
