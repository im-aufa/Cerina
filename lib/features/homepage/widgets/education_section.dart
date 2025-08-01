// lib/features/homepage/widgets/education_section.dart
import 'package:flutter/material.dart';
import 'package:cerina/core/utils/responsive.dart';
import '../data/homepage_data.dart';
import 'education_card.dart'; // Adjust path if separate file

class EducationSection extends StatelessWidget {
  final HomepageData data;
  final double topPosition;

  const EducationSection({
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
            // First Row (existing content)
            Row(
              children: [
                Text(
                  data.educationText,
                  style: TextStyle(
                    fontSize: responsive.fontSize(16),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Lihat Semua',
                    style: TextStyle(
                      fontSize: responsive.fontSize(16),
                      color: Colors.black,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: responsive.fontSize(16),
                ),
              ],
            ),
            SizedBox(height: responsive.height(1)), // Space between rows
            // Second Row (fixed, non-scrollable container)
            SizedBox(
              height: responsive.height(15), // Matches EducationCard height
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Distribute space evenly
                children: [
                  EducationCard(
                    imagePath: 'assets/images/01.png',
                    title: 'Title 1',
                    subtitle: 'Subtitle 1',
                    responsive: responsive,
                  ),
                  EducationCard(
                    imagePath: 'assets/images/02.png',
                    title: 'Title 2',
                    subtitle: 'Subtitle 2',
                    responsive: responsive,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
