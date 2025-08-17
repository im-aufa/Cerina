// lib/features/homepage/widgets/education_section.dart
import 'package:flutter/material.dart';
import '../data/homepage_data.dart';
import 'education_card.dart';

class EducationSection extends StatelessWidget {
  final HomepageData data;

  const EducationSection({
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
        Row(
          children: [
            Text(
              data.educationText,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'Lihat Semua',
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: textTheme.titleMedium?.fontSize,
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.15, // Matches EducationCard height
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EducationCard(
                imagePath: 'assets/images/01.png',
                title: 'Title 1',
                subtitle: 'Subtitle 1',
              ),
              EducationCard(
                imagePath: 'assets/images/02.png',
                title: 'Title 2',
                subtitle: 'Subtitle 2',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
